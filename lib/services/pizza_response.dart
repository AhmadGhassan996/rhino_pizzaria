class PResponse<T> {
  Status status = Status.FRESH;
  String? message;
  T? data;

  PResponse.loading() : status = Status.LOADING;
  PResponse.fresh() : status = Status.FRESH;
  PResponse.completed(this.data) : status = Status.COMPLETED;
  PResponse.error(this.message) : status = Status.ERROR;
}

enum Status {
  LOADING,
  COMPLETED,
  FRESH,
  ERROR,
}
