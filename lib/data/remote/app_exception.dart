class AppException implements Exception {
  final String _message;
  final String _prefix;

  AppException(this._message, this._prefix);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message!, "Error During Communication: ");
}

class NotFoundException extends AppException {
  NotFoundException([String? message]) : super (message!, "No data found in the system: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised Request: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message!, "Invalid Input: ");
}

class UnprocessableEntityExeption extends AppException{
  UnprocessableEntityExeption([message]) : super(message, "Unprocessable Entity");
}
