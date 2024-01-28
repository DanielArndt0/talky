import 'package:talky_chat/Errors/Failure.dart';

enum AuthErrorType {
  invalidEmail(code: 'invalid-email'),
  userDisable(code: 'user-disabled'),
  userNotFound(code: 'user-not-found'),
  wrongPassword(code: 'wrong-password'),
  emailAlreadyInUse(code: 'email-already-in-use'),
  operationNotAllowed(code: 'operation-not-allowed'),
  weakPassword(code: 'weak-password'),
  userCredentialIsNull(code: 'user-credential-is-null'),
  userAdditionalInfoIsNull(code: 'user-additional-info-is-null'),
  userDataIsNull(code: 'user-data-is-null');

  const AuthErrorType({required this.code});
  final String code;
}

class AuthException extends Failure {
  AuthException({
    required super.message,
    super.code,
    super.stackTrace,
  });
}

class AuthCredentialException extends AuthException {
  AuthCredentialException({
    required super.message,
    super.code,
    super.stackTrace,
  });
}

class InvalidEmailException extends AuthException {
  InvalidEmailException({
    super.stackTrace,
  }) : super(
          code: AuthErrorType.invalidEmail.code,
          message: 'The email address is not valid.',
        );
}

class EmailAlreadyInUseException extends AuthException {
  EmailAlreadyInUseException({
    super.stackTrace,
  }) : super(
          code: AuthErrorType.emailAlreadyInUse.code,
          message:
              'There already exists an account with the given email address.',
        );
}

class OperationNotAllowedException extends AuthException {
  OperationNotAllowedException({
    super.stackTrace,
  }) : super(
          code: AuthErrorType.operationNotAllowed.code,
          message: 'Email/password accounts are not enabled.',
        );
}

class WeakPasswordException extends AuthException {
  WeakPasswordException({
    super.stackTrace,
  }) : super(
          code: AuthErrorType.weakPassword.code,
          message: 'The password is not strong enough.',
        );
}

class UserDisabledException extends AuthException {
  UserDisabledException({
    super.stackTrace,
  }) : super(
            code: AuthErrorType.userDisable.code,
            message:
                'The user corresponding to the given email has been disabled.');
}

class UserNotFoundException extends AuthException {
  UserNotFoundException({
    super.stackTrace,
  }) : super(
          code: AuthErrorType.userNotFound.code,
          message: 'There is no user corresponding to the given email.',
        );
}

class WrongPasswordException extends AuthException {
  WrongPasswordException({
    super.stackTrace,
  }) : super(
          code: AuthErrorType.wrongPassword.code,
          message:
              'The password is invalid for the given email, or the account corresponding to the email does not have a password set.',
        );
}

class UserCredentialIsNull extends AuthCredentialException {
  UserCredentialIsNull({
    super.stackTrace,
  }) : super(
          code: AuthErrorType.userCredentialIsNull.code,
          message: 'The user credential is null.',
        );
}

class UserIsNull extends AuthCredentialException {
  UserIsNull({super.stackTrace})
      : super(
          code: AuthErrorType.userDataIsNull.code,
          message: 'The user data is null.',
        );
}

class UserAdditionalInfoIsNull extends AuthCredentialException {
  UserAdditionalInfoIsNull({
    super.stackTrace,
  }) : super(
          code: AuthErrorType.userAdditionalInfoIsNull.code,
          message: 'The user additional info is null.',
        );
}
