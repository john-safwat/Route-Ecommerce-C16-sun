enum Status { success, loading, initial, error }

class Resources<T> {
  final Status status;
  final T? data;
  final Exception? exception;

  const Resources._() : status = Status.initial, data = null, exception = null;

  // initial
  const Resources.initial()
    : status = Status.initial,
      data = null,
      exception = null;

  // loading
  const Resources.loading({this.data})
    : status = Status.loading,
      exception = null;

  // success
  const Resources.success({this.data})
    : status = Status.success,
      exception = null;

  // error
  const Resources.error({this.data, this.exception}) : status = Status.error;
}
