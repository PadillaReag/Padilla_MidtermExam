// lib/firebase_options.dart
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return web;
    // If you try to run on non-web without proper config, throw a clear error:
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
        throw UnsupportedError(
          'FirebaseOptions not configured for this platform. '
          'Run `flutterfire configure` to generate full options.',
        );
      case TargetPlatform.fuchsia:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  // Web config (from your Firebase project)
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDqweQa3hM0K8UNkpRe2USSV_AnsgRVrW4',
    authDomain: 'padillaportfolio-6a19d.firebaseapp.com',
    projectId: 'padillaportfolio-6a19d',
    storageBucket: 'padillaportfolio-6a19d.firebasestorage.app',
    messagingSenderId: '921436046251',
    appId: '1:921436046251:web:38406a02823021f42d08ee',
    measurementId: 'G-1B13S03Z22',
  );
}
