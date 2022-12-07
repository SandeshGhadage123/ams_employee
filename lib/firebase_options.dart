// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
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
        return macos;
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
    apiKey: 'AIzaSyCOuVeMaGzelitdzVLyKyDB2BnwIYRfPC4',
    appId: '1:555499288950:web:9f04de9092b4a58c662257',
    messagingSenderId: '555499288950',
    projectId: 'ams-employee',
    authDomain: 'ams-employee.firebaseapp.com',
    storageBucket: 'ams-employee.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCUefnpg-kwmW6msqD357eyD4aHxs1pk0E',
    appId: '1:555499288950:android:1064a36f63f80f61662257',
    messagingSenderId: '555499288950',
    projectId: 'ams-employee',
    storageBucket: 'ams-employee.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCh-N2qXPdOt01jQ6DMv5sH88dmCUeAQik',
    appId: '1:555499288950:ios:47d084b42a499488662257',
    messagingSenderId: '555499288950',
    projectId: 'ams-employee',
    storageBucket: 'ams-employee.appspot.com',
    androidClientId: '555499288950-vf29kjdd7uqvgqkk1th5f8ad8c9olfbd.apps.googleusercontent.com',
    iosClientId: '555499288950-muresd2n7514vhodufkdp9te39kvk68q.apps.googleusercontent.com',
    iosBundleId: 'com.example.amsEmployee',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCh-N2qXPdOt01jQ6DMv5sH88dmCUeAQik',
    appId: '1:555499288950:ios:47d084b42a499488662257',
    messagingSenderId: '555499288950',
    projectId: 'ams-employee',
    storageBucket: 'ams-employee.appspot.com',
    androidClientId: '555499288950-vf29kjdd7uqvgqkk1th5f8ad8c9olfbd.apps.googleusercontent.com',
    iosClientId: '555499288950-muresd2n7514vhodufkdp9te39kvk68q.apps.googleusercontent.com',
    iosBundleId: 'com.example.amsEmployee',
  );
}