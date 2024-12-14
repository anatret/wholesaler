import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBqta1jx-YAj9nB7UyHCqlU2ZuQ8uKC-Es",
            authDomain: "f-f-pizza-7sui91.firebaseapp.com",
            projectId: "f-f-pizza-7sui91",
            storageBucket: "f-f-pizza-7sui91.appspot.com",
            messagingSenderId: "1058327461934",
            appId: "1:1058327461934:web:cf0a9770cb7ab1350fdfbf"));
  } else {
    await Firebase.initializeApp();
  }
}
