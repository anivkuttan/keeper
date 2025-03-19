enum Status { success, failure }

class DataResponse<T> {
  final Status status;
  final Info info;
  final T? data;

  DataResponse.success({required this.info, this.data})
    : status = Status.success;

  DataResponse.failure({required this.info})
    : status = Status.failure,
      data = null;

  bool get isSuccess => status == Status.success;
}

class Info {
  final String message;
  final int? statusCode;

  Info({required this.message, this.statusCode});
}
