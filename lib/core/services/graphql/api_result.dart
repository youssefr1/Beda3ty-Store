abstract class ApiResult<T> {
  const ApiResult();

  const factory ApiResult.success(T data) = ApiSuccess<T>;
  const factory ApiResult.failure(String error) = ApiFailure<T>;

  R when<R>({
    required R Function(T data) success,
    required R Function(String error) failure,
  }) {
    if (this is ApiSuccess<T>) {
      return success((this as ApiSuccess<T>).data);
    } else {
      return failure((this as ApiFailure<T>).error);
    }
  }
}

class ApiSuccess<T> extends ApiResult<T> {
  final T data;
  const ApiSuccess(this.data);
}

class ApiFailure<T> extends ApiResult<T> {
  final String error;
  const ApiFailure(this.error);
}
