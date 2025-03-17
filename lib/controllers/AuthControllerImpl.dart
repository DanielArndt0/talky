import 'package:firebase_auth/firebase_auth.dart';
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
    final userCredential = await authService.signUpUser(
      email: email,
      password: password,
    );

    currentUser.updateUserCredential(userCredential);
    currentUser.updateName(name);
    
    await cloudDBService.refreshUser();
  }
}
