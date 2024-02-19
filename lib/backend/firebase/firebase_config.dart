import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCIUWLFy8ApT2gsKYKt92elufBCpvWxXZc",
            authDomain: "dating-cupido-catolico-u8vab5.firebaseapp.com",
            projectId: "dating-cupido-catolico-u8vab5",
            storageBucket: "dating-cupido-catolico-u8vab5.appspot.com",
            messagingSenderId: "448810925636",
            appId: "1:448810925636:web:83ea98864e9c2e59854611"));
  } else {
    await Firebase.initializeApp();
  }
}
