sealed class ApiResults<T> {}

class Success<T> extends ApiResults<T> {
  T? data;

  Success({this.data});
}

class Fail<T> extends ApiResults<T> {
  Exception? exception;
  String? message;
  Fail({this.exception , this.message});
}
