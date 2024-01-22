import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:talky_chat/ProviderHandler.dart';
import 'package:talky_chat/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(providerHandler);
}
