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
    apiKey: 'AIzaSyD9miSxi9L-yug2ZeewQGjWeQo4wRbMSHU',
    appId: '1:816128504538:web:04797ce825d3e9bdfe6be3',
    messagingSenderId: '816128504538',
    projectId: 'finance-tracker-8f357',
    authDomain: 'finance-tracker-8f357.firebaseapp.com',
    storageBucket: 'finance-tracker-8f357.appspot.com',
    measurementId: 'G-BZ51H878CN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDLz2hk1LiAQJIS2okxtuk7ZsF_G48AAMo',
    appId: '1:816128504538:android:91c5c7f69c39ec53fe6be3',
    messagingSenderId: '816128504538',
    projectId: 'finance-tracker-8f357',
    storageBucket: 'finance-tracker-8f357.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCm0z26dRjc2YCLBO6O5UgDPmRfwUDujPk',
    appId: '1:816128504538:ios:68722086d900ebb7fe6be3',
    messagingSenderId: '816128504538',
    projectId: 'finance-tracker-8f357',
    storageBucket: 'finance-tracker-8f357.appspot.com',
    iosClientId:
        '816128504538-0v59n7f748cifoureiat6t5v8nc8b746.apps.googleusercontent.com',
    iosBundleId: 'com.example.financeLoan',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCm0z26dRjc2YCLBO6O5UgDPmRfwUDujPk',
    appId: '1:816128504538:ios:e38c5fba47e47be4fe6be3',
    messagingSenderId: '816128504538',
    projectId: 'finance-tracker-8f357',
    storageBucket: 'finance-tracker-8f357.appspot.com',
    iosClientId:
        '816128504538-v1p6smuftj494nt1fbsrlnfiu3g360uj.apps.googleusercontent.com',
    iosBundleId: 'com.example.financeLoan.RunnerTests',
  );
}
