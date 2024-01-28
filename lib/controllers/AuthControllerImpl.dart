import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:talky_chat/Errors/AuthException.dart';
import 'package:talky_chat/controllers/interfaces/AuthController.dart';
import 'package:talky_chat/providers/CurrentUserProvider.dart';
import 'package:talky_chat/services/interfaces/AuthService.dart';
import 'package:talky_chat/services/interfaces/CloudDBService.dart';

class AuthControllerImpl extends AuthController {
  final AuthService authService;
  final CloudDBService cloudDBService;
  final CurrentUserProvider currentUser;

  AuthControllerImpl({
    required this.authService,
    required this.cloudDBService,
    required this.currentUser,
  });

  @override
  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final userCredential = await authService.signUpUser(
        email: email,
        password: password,
      );
      currentUser.update(
        credential: userCredential,
        name: name,
      );
      await cloudDBService.updateUser();
    } on AuthException catch (e, stacktrace) {
      print(e.message);
    }
  }
}
