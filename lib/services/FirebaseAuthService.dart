import 'package:firebase_auth/firebase_auth.dart';
import 'package:talky_chat/Errors/AuthException.dart';
import 'package:talky_chat/services/interfaces/AuthService.dart';

class FirebaseAuthService extends AuthService {
  FirebaseAuthService._();
  static final FirebaseAuthService instance = FirebaseAuthService._();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _userCredentialValidation(UserCredential userCredential) {
    if (userCredential.additionalUserInfo == null) {
      throw UserAdditionalInfoIsNull();
    } else if (userCredential.credential == null) {
      throw UserCredentialIsNull();
    } else if (userCredential.user == null) {
      throw UserIsNull();
    }
  }

  @override
  Future<UserCredential> signInUser({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // _userCredentialValidation(userCredential); TODO
      return userCredential;
    } on FirebaseAuthException catch (e, s) {
      if (e.code == AuthErrorType.invalidEmail.code) {
        throw InvalidEmailException(stackTrace: s);
      } else if (e.code == AuthErrorType.userDisable.code) {
        throw UserDisabledException(stackTrace: s);
      } else if (e.code == AuthErrorType.userNotFound.code) {
        throw UserNotFoundException(stackTrace: s);
      } else if (e.code == AuthErrorType.wrongPassword.code) {
        throw WrongPasswordException(stackTrace: s);
      } else {
        throw AuthException(
          code: e.code,
          message: e.message ?? '',
          stackTrace: s,
        );
      }
    }
  }

  @override
  Future<UserCredential> signUpUser({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // _userCredentialValidation(userCredential); TODO
    } on FirebaseAuthException catch (e, s) {
      if (e.code == AuthErrorType.invalidEmail.code) {
        throw InvalidEmailException(stackTrace: s);
      } else if (e.code == AuthErrorType.emailAlreadyInUse.code) {
        throw EmailAlreadyInUseException(stackTrace: s);
      } else if (e.code == AuthErrorType.operationNotAllowed.code) {
        throw OperationNotAllowedException(stackTrace: s);
      } else if (e.code == AuthErrorType.weakPassword.code) {
        throw WeakPasswordException(stackTrace: s);
      } else {
        throw AuthException(
          code: e.code,
          message: e.message ?? 'AuthException',
          stackTrace: s,
        );
      }
    }
  }

  @override
  Future<void> signOut() async => await _auth.signOut();

  @override
  User? get currentUser => _auth.currentUser;
}
