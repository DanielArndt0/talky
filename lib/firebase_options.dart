// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBLmhuZX7eX0NxETIlFGTTAvB8MqW2eZS4',
    appId: '1:1008148447720:web:ec19db0a01a50be1ab645d',
    messagingSenderId: '1008148447720',
    projectId: 'talkychat-56d97',
    authDomain: 'talkychat-56d97.firebaseapp.com',
    storageBucket: 'talkychat-56d97.appspot.com',
    measurementId: 'G-H57JL16GVC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAkDtLJvtnsATD3oqc6qz2r1X7eiapDZnY',
    appId: '1:1008148447720:android:3c71fa2420d47fb9ab645d',
    messagingSenderId: '1008148447720',
    projectId: 'talkychat-56d97',
    storageBucket: 'talkychat-56d97.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDEuDJGhe8LPZtWIug7sSSd9nsIG-xzdSQ',
    appId: '1:1008148447720:ios:7ee9bc2521e6a155ab645d',
    messagingSenderId: '1008148447720',
    projectId: 'talkychat-56d97',
    storageBucket: 'talkychat-56d97.appspot.com',
    iosClientId:
        '1008148447720-8kgq53odr2q6r0anff8scb18f778t7p4.apps.googleusercontent.com',
    iosBundleId: 'com.example.talkyChat',
  );
}
