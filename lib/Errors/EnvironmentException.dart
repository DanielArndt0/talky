import 'package:talky_chat/Errors/Failure.dart';

class EnvironmentException extends Failure {
  EnvironmentException({
    super.message,
    super.stackTrace,
    super.code,
    super.exception,
  });
}
