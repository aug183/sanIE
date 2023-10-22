import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAUW9fAaWJFIk46gDM0UMFy6c6QWrJx02g",
            authDomain: "tagging-system-e425f.firebaseapp.com",
            projectId: "tagging-system-e425f",
            storageBucket: "tagging-system-e425f.appspot.com",
            messagingSenderId: "954520699074",
            appId: "1:954520699074:web:25c14339f80a6396c3fb5b"));
  } else {
    await Firebase.initializeApp();
  }
}
