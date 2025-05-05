import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rickandmorty_app/views/home/home.dart';


Future<void> createUserFirebase() async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: "prueban@prueba.com",
      password: "prueba!",
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
    } else if (e.code == 'email-already-in-use') {
    } else {
    }
  } catch (e) {
  }
}
  
Future<void> loginFirebase(BuildContext context, String user, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: user,
      password: password,
    );
    
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      _showErrorSnackBar(context);
    } else if (e.code == 'wrong-password') {
      _showErrorSnackBar(context);
    } else {
      _showErrorSnackBar(context);
    }
  } catch (e) {
    _showErrorSnackBar(context);
  }
}

Future<void> loginWithGoogle() async {
  try {

    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    
    if (googleUser == null) {

      return;
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
  } catch (e) {
  }
}


Future<void> loginWithGoogleWeb() async {
  try {
    final GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
      ..addScope('email')
      ..setCustomParameters({'prompt': 'select_account'});

    UserCredential userCredential = await FirebaseAuth.instance.signInWithPopup(googleProvider);

  } catch (e) {
  }
}

Future<void> logoutFirebase() async {
  try {
    await FirebaseAuth.instance.signOut();

    final googleSignIn = GoogleSignIn();
    if (await googleSignIn.isSignedIn()) {
      await googleSignIn.signOut();
    }

  } catch (e) {
  }
}


void _showErrorSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Error, verifique usuario o contraseña e intente nuevamente'),
      backgroundColor: const Color.fromARGB(255, 85, 21, 15), 
      duration: const Duration(seconds: 3),
    ),
  );
}