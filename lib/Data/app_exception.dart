class AppException implements Exception {
  final _prefix;
  final _message;

  AppException([this._prefix, this._message]);
}

class FectchDataException extends AppException {
  FectchDataException(_message) : super('Error during communication', _message);
}