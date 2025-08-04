import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import '../flavor/flavor_config.dart';
import 'base_response.dart';

enum RequestMethod { get, post, put, delete, patch, head, options }

final _storage = FlutterSecureStorage();

class DioClient {
  late Dio dio;
  bool _isRefreshing = false;
  final List<Function()> _retryQueue = [];

  DioClient() {
    final options = BaseOptions(
      baseUrl: FlavorConfig.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 10),
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      validateStatus: (status) => status != null && status < 500,
    );

    dio = Dio(options);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await _storage.read(key: 'accessToken');
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        options.extra['startTime'] = DateTime.now();
        return handler.next(options);
      },
      onResponse: (response, handler) {
        final start = response.requestOptions.extra['startTime'] as DateTime?;
        final duration = start != null ? DateTime.now().difference(start) : null;
        _printCurl(response.requestOptions, response.statusCode, duration);
        return handler.next(response);
      },
      onError: (DioException e, handler) async {
        final res = e.response;
        final options = e.requestOptions;

        if (res?.statusCode == 401 && !_isRefreshing) {
          _isRefreshing = true;
          final newToken = await _refreshToken();
          _isRefreshing = false;

          if (newToken != null) {
            await _storage.write(key: 'accessToken', value: newToken);
            _retryQueue.forEach((cb) => cb());
            _retryQueue.clear();
          }
        } else if (res?.statusCode == 401 && _isRefreshing) {
          _retryQueue.add(() async {
            final token = await _storage.read(key: 'accessToken');
            options.headers['Authorization'] = 'Bearer $token';
            final clone = await dio.fetch(options);
            handler.resolve(clone);
          });
          return;
        }

        print("❌ Dio error: ${e.message}");
        return handler.next(e);
      },
    ));
  }

  void _printCurl(RequestOptions options, int? statusCode, Duration? duration) {
    final token = options.headers['Authorization'];
    final shortToken = token is String && token.length > 20 ? '${token.substring(0, 20)}...' : token;

    final buffer = StringBuffer();
    buffer.writeln('🌀 cURL request:');
    buffer.writeln('• Method: ${options.method}');
    buffer.writeln('• URL: ${options.uri}');
    if (shortToken != null) buffer.writeln('• Token: $shortToken');
    if (duration != null) buffer.writeln('• Duration: ${duration.inMilliseconds}ms');
    if (options.data != null) buffer.writeln('• Body: ${jsonEncode(options.data)}');
    buffer.writeln('---');
    print(buffer.toString());
  }

  Future<dynamic> request({
    required String path,
    required RequestMethod method,
    dynamic body,
    Map<String, dynamic>? query,
    bool sendToken = true,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final options = Options(method: method.name.toUpperCase());

      final response = await dio.request(
        path,
        data: body,
        queryParameters: query,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      final status = response.statusCode ?? 500;

      if (status >= 200 && status < 300) {
        return response.data;
      } else {
        final errorMessage = response.data is Map && response.data['error'] != null
            ? response.data['error']
            : 'Lỗi từ server';
        throw Exception(errorMessage);
      }
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }

  Future<BaseResponse<T>> requestTyped<T>({
    required String path,
    required RequestMethod method,
    required T Function(dynamic data) fromJson,
    dynamic body,
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
    bool sendToken = true,
  }) async {
    final raw = await request(
      path: path,
      method: method,
      body: body,
      query: query,
      cancelToken: cancelToken,
      sendToken: sendToken,
    );

    return BaseResponse.fromJson({'data': raw}, fromJson);
  }

  Future<String?> _refreshToken() async {
    final refreshToken = await _storage.read(key: 'refreshToken');
    if (refreshToken == null || refreshToken.isEmpty) return null;

    try {
      final response = await dio.post('/auth/refresh_token', data: {
        'refreshToken': refreshToken,
      });

      return response.data['accessToken'];
    } catch (_) {
      await _storage.delete(key: 'accessToken');
      return null;
    }
  }

  String _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) return 'Timeout kết nối';
    if (e.type == DioExceptionType.receiveTimeout) return 'Timeout phản hồi';
    if (e.type == DioExceptionType.badResponse) {
      try {
        final data = e.response?.data;
        if (data is Map && data['error'] != null) {
          return data['error'];
        }
      } catch (_) {}
      return 'Lỗi server';
    }
    return 'Lỗi không xác định';
  }

  Future<String> downloadFile(
    String url, {
    String? fileName,
    ProgressCallback? onProgress,
    CancelToken? cancelToken,
  }) async {
    final dir = await getApplicationDocumentsDirectory();
    final savePath = '${dir.path}/${fileName ?? url.split('/').last}';
    await dio.download(
      url,
      savePath,
      onReceiveProgress: onProgress,
      cancelToken: cancelToken,
    );
    return savePath;
  }

  Future<dynamic> uploadFile({
    required String path,
    required File file,
    String fieldName = 'file',
    Map<String, dynamic>? fields,
    ProgressCallback? onProgress,
    CancelToken? cancelToken,
  }) async {
    final fileName = file.path.split('/').last;

    final formData = FormData.fromMap({
      if (fields != null) ...fields,
      fieldName: await MultipartFile.fromFile(file.path, filename: fileName),
    });

    final response = await dio.post(
      path,
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
      onSendProgress: onProgress,
      cancelToken: cancelToken,
    );

    return response.data;
  }
}
