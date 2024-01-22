import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthServiceType<UserCredentialType> {
  Future<UserCredentialType> signUpUser({
    required String email,
    required String password,
  });

  Future<UserCredentialType> signInUser({
    required String email,
    required String password,
  });

  Future<void> signOut();

  User? get currentUser;
}
