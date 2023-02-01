import 'package:chat/pages/cons.dart';
import 'package:chat/pages/home.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class AuthGatePage extends StatelessWidget {
  const AuthGatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // is user login

        if (!snapshot.hasData) {
          return SignInScreen(
            providerConfigs: [
              EmailProviderConfiguration(),
            ],
            actions: [
              // login
              AuthStateChangeAction<SignedIn>((context, state) {
                uid = state.user!.uid;
                email = state.user!.email!;
              }),

              //signUP  -> save user data to firestore
              AuthStateChangeAction<UserCreated>(
                (context, state) {
                  // save  user data to firestore
                  //
                  uid = state.credential.user!.uid;
                  email = state.credential.user!.email!;

                  //save to cloud firestore

                  // user / [uid] / [user document]

                  firestore.collection("users").doc(uid).set({
                    'uid': uid,
                    'email': email,
                  });
                },
              )
            ],
          );
        }
        // already login

        uid = firebaseAuth.currentUser!.uid;
        email = firebaseAuth.currentUser!.email!;
        return HomePage();
      },
    );
  }
}
