// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:talky_chat/Env.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static FirebaseOptions web = FirebaseOptions(
    apiKey: Env.web.apiKey,
    appId: Env.web.appId,
    messagingSenderId: Env.messagingSenderId,
    projectId: Env.projectId,
    authDomain: Env.web.authDomain,
    storageBucket: Env.storageBucket,
    measurementId: Env.web.measurementId,
  );

  static FirebaseOptions android = FirebaseOptions(
    apiKey: Env.android.apiKey,
    appId: Env.android.appId,
    messagingSenderId: Env.messagingSenderId,
    projectId: Env.projectId,
    storageBucket: Env.storageBucket,
  );

  static FirebaseOptions ios = FirebaseOptions(
    apiKey: Env.ios.apiKey,
    appId: Env.ios.appId,
    messagingSenderId: Env.messagingSenderId,
    projectId: Env.projectId,
    storageBucket: Env.storageBucket,
    iosClientId: Env.ios.clientId,
    iosBundleId: Env.ios.bundleId,
  );
}
