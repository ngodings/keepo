class BaseResponse<T> {
  final String? status;
  final String? message;
  final String? serverTime;
  final T? data;

  BaseResponse({
    this.message,
    this.data,
    this.status,
    this.serverTime,
  });
}
