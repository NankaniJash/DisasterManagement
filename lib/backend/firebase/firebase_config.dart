import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAtLj2H4099kkKv1I3W8IErZpZ_M1aXbAE",
            authDomain: "testing-3860d.firebaseapp.com",
            projectId: "testing-3860d",
            storageBucket: "testing-3860d.firebasestorage.app",
            messagingSenderId: "220917245131",
            appId: "1:220917245131:web:b5f05ac9682a79c054274e",
            measurementId: "G-H29MEN0B6Q"));
  } else {
    await Firebase.initializeApp();
  }
}
