class ApiResponse<T> {
  bool success;
  T? data;
  String? error;

  ApiResponse(this.success, this.data, this.error);

}