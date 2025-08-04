// import 'dart:convert';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:http/http.dart' as http;

// enum RequestMethod { get, post, put, delete, patch, head, options }


// const _storage = FlutterSecureStorage();

// Future<dynamic> request({
//   required String path,
//   required RequestMethod method,
//   Map<String, dynamic>? body,
//   Map<String, dynamic>? query,
//   bool sendToken = true,
// }) async {
//   Uri uri = Uri.parse(path);

//   if (query != null && query.isNotEmpty) {
//     uri = uri.replace(
//         queryParameters: query.map((k, v) => MapEntry(k, v.toString())));
//   }

//   Map<String, String> headers = {'Content-Type': 'application/json'};

//   if (sendToken) {
//     final token = await _storage.read(key: 'accessToken');
//     if (token != null) {
//       headers['Authorization'] = 'Bearer $token';
//     }
//   }

//   http.Response response;

//   switch (method) {
//     case RequestMethod.get:
//       response = await http.get(uri, headers: headers);
//       break;
//     case RequestMethod.post:
//       response =
//           await http.post(uri, headers: headers, body: jsonEncode(body ?? {}));
//       break;
//     case RequestMethod.put:
//       response =
//           await http.put(uri, headers: headers, body: jsonEncode(body ?? {}));
//       break;
//     case RequestMethod.delete:
//       response = await http.delete(uri, headers: headers);
//       break;
//     case RequestMethod.patch:
//       response =
//           await http.patch(uri, headers: headers, body: jsonEncode(body ?? {}));
//       break;
//     case RequestMethod.head:
//       response = await http.head(uri, headers: headers);
//       break;
//     case RequestMethod.options:
//       final client = http.Client();
//       final request = http.Request('OPTIONS', uri)..headers.addAll(headers);
//       final streamed = await client.send(request);
//       response = await http.Response.fromStream(streamed);
//       break;
//   }

//   final decoded = jsonDecode(response.body);

//   if (response.statusCode >= 200 && response.statusCode < 300) {
//     return decoded;
//   } else {
//     throw Exception(decoded['error'] ?? 'Lỗi mạng hoặc máy chủ');
//   }
// }
