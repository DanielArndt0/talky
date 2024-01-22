import 'package:firebase_auth/firebase_auth.dart';
import 'package:talky_chat/services/interfaces/AuthServiceType.dart';

abstract class AuthService extends AuthServiceType<UserCredential> {}
