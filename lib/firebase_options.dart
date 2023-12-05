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
    apiKey: 'AIzaSyB8_ukv498H5UXGqBT5WhDZ6rzsU9Rt8vY',
    appId: '1:459735895311:web:ecfa72255badcdc134827a',
    messagingSenderId: '459735895311',
    projectId: 'authenticationbloc-d1ff7',
    authDomain: 'authenticationbloc-d1ff7.firebaseapp.com',
    storageBucket: 'authenticationbloc-d1ff7.appspot.com',
    measurementId: 'G-3JE5D8N59L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAW8gYjcIwg78GZ-M9b7EyDEkWlpNnIVao',
    appId: '1:459735895311:android:a40963483b68efa034827a',
    messagingSenderId: '459735895311',
    projectId: 'authenticationbloc-d1ff7',
    storageBucket: 'authenticationbloc-d1ff7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyADjrhoasYfnOFna9izb74rCyVBqS0wST8',
    appId: '1:459735895311:ios:3d544731f06f925434827a',
    messagingSenderId: '459735895311',
    projectId: 'authenticationbloc-d1ff7',
    storageBucket: 'authenticationbloc-d1ff7.appspot.com',
    iosBundleId: 'com.example.movieApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyADjrhoasYfnOFna9izb74rCyVBqS0wST8',
    appId: '1:459735895311:ios:c0a937e79e77920834827a',
    messagingSenderId: '459735895311',
    projectId: 'authenticationbloc-d1ff7',
    storageBucket: 'authenticationbloc-d1ff7.appspot.com',
    iosBundleId: 'com.example.movieApp.RunnerTests',
  );
}