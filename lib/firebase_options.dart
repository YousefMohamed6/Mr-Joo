// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDmvJ4krGJxFKxn7O4dhNAtvhjjuPHKaAE',
    appId: '1:483758448499:android:d146ca92a9abcdac3eaf06',
    messagingSenderId: '483758448499',
    projectId: 'i-teacher-96035',
    storageBucket: 'i-teacher-96035.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCtEO9Net7dN6QdZQe6tCtXKHN15A0wPRQ',
    appId: '1:483758448499:ios:e564b18dcb94f0d23eaf06',
    messagingSenderId: '483758448499',
    projectId: 'i-teacher-96035',
    storageBucket: 'i-teacher-96035.firebasestorage.app',
    androidClientId: '483758448499-2juaamtbcvdni1lp5b4lf4v8p6l2bh42.apps.googleusercontent.com',
    iosClientId: '483758448499-gqvkh8rjc3d1h8cgn5bqkg68o51mkon5.apps.googleusercontent.com',
    iosBundleId: 'com.eljoker.iteacher',
  );

}