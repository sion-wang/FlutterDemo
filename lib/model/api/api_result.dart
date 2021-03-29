import 'package:flutter/cupertino.dart';

abstract class ApiResult<T> {
  static ApiResult<T> success<T>(T data) {
    return Success(data: data);
  }
  static ApiResult<T> error<T>(Exception exception) {
    return Error(exception: exception);
  }
  static ApiResult<T> loading<T>() {
    return Loading();
  }
  static ApiResult loaded<T>() {
    return Loaded();
  }
}

class Success<T> extends ApiResult<T> {
  T? data;
  Success({required this.data});
}

class Error<T> extends ApiResult<T> {
  Exception exception;
  Error({required this.exception});
}

class Loading<T> extends ApiResult<T> {}
class Loaded<T> extends ApiResult<T> {}
