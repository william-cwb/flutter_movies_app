class ApiResponse<T> {
  static final String connError = "Falha de comunicação com o servidor";
  bool ok;
  String msg;
  T data;

  ApiResponse.onSuccess(this.data) {
    ok = true;
  }

  ApiResponse.onError(this.msg) {
    ok = false;
  }
}
