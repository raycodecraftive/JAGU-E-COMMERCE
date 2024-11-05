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
        return windows;
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
    apiKey: 'AIzaSyDPZz_PO-iw-eY4YYTOWARn06zfcCNk-Vk',
    appId: '1:171523603828:web:26ac8ffae025810df54021',
    messagingSenderId: '171523603828',
    projectId: 'myapp-f7ac8',
    authDomain: 'myapp-f7ac8.firebaseapp.com',
    storageBucket: 'myapp-f7ac8.appspot.com',
    measurementId: 'G-T8BNCCV21C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6LwYXXiMqJ6CyngYm6OC3QacLJhKzNWM',
    appId: '1:171523603828:android:53b897f98a7c94eef54021',
    messagingSenderId: '171523603828',
    projectId: 'myapp-f7ac8',
    storageBucket: 'myapp-f7ac8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCexrICril5PFNmndx6hLHBC9v3wf2iTCU',
    appId: '1:171523603828:ios:db912fccda6d32eaf54021',
    messagingSenderId: '171523603828',
    projectId: 'myapp-f7ac8',
    storageBucket: 'myapp-f7ac8.appspot.com',
    iosBundleId: 'com.example.myapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCexrICril5PFNmndx6hLHBC9v3wf2iTCU',
    appId: '1:171523603828:ios:db912fccda6d32eaf54021',
    messagingSenderId: '171523603828',
    projectId: 'myapp-f7ac8',
    storageBucket: 'myapp-f7ac8.appspot.com',
    iosBundleId: 'com.example.myapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDPZz_PO-iw-eY4YYTOWARn06zfcCNk-Vk',
    appId: '1:171523603828:web:51b9c4bfd99c9ad9f54021',
    messagingSenderId: '171523603828',
    projectId: 'myapp-f7ac8',
    authDomain: 'myapp-f7ac8.firebaseapp.com',
    storageBucket: 'myapp-f7ac8.appspot.com',
    measurementId: 'G-LSLTLBVLGX',
  );
}
