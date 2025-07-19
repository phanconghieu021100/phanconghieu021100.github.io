class BaseResponse<T> {
  final T data;
  final int? statusCode;
  final String? message;

  BaseResponse({
    required this.data,
    this.statusCode,
    this.message,
  });

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) {
    return BaseResponse<T>(
      data: fromJsonT(json['data']),
      statusCode: json['statusCode'],
      message: json['message'],
    );
  }
}
