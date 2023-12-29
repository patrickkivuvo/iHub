import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (Platform.isIOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        appId: '',
        apiKey: '',
        projectId: '',
        messagingSenderId: '',
        iosBundleId: '',
      );
    } else {
      // Android
      return const FirebaseOptions(
        appId: '1:898370915227:android:a4bf559769591cf5cd6f3e',
        apiKey: 'AIzaSyD5StMOYNxhd-EDnw3t9O3IT1eo7GXH0Is',
        projectId: 'myduka-af931',
        messagingSenderId: '898370915227',
      );
    }
  }
}
