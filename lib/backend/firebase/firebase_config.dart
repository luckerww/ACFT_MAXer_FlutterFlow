import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD9vix_ae7vZaeD4X0_DhDfcjFq5V2f6D0",
            authDomain: "a-i-bedtime-stories-amb-f57iyc.firebaseapp.com",
            projectId: "a-i-bedtime-stories-amb-f57iyc",
            storageBucket: "a-i-bedtime-stories-amb-f57iyc.appspot.com",
            messagingSenderId: "1004407396530",
            appId: "1:1004407396530:web:a2f4cb329ad198a98f91ab"));
  } else {
    await Firebase.initializeApp();
  }
}
