import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC48lgiH1j7EeVemGXlHZUqOHzsHXZPeRo",
            authDomain: "nutricheck-61b39.firebaseapp.com",
            projectId: "nutricheck-61b39",
            storageBucket: "nutricheck-61b39.appspot.com",
            messagingSenderId: "64777738326",
            appId: "1:64777738326:web:a6063661d69692052143f7"));
  } else {
    await Firebase.initializeApp();
  }
}
