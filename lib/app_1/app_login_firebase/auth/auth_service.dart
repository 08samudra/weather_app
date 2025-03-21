import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<void> loginWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        Fluttertoast.showToast(msg: "Login dibatalkan oleh pengguna.");
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential cred = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(
        cred,
      );

      if (userCredential.user != null) {
        log("Login dengan Google berhasil: ${userCredential.user!.email}");
        Fluttertoast.showToast(msg: "Login berhasil!");

        // Navigasi ke halaman setelah login
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      log("Error saat login dengan Google: $e");
      Fluttertoast.showToast(msg: "Terjadi kesalahan saat login.");
    }
  }

  Future<User?> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return cred.user;
    } catch (e) {
      log("Something went wrong: $e");
      Fluttertoast.showToast(msg: "Terjadi kesalahan saat mendaftar.");
    }
    return null;
  }

  Future<User?> loginUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return cred.user;
    } catch (e) {
      log("Something went wrong: $e");
      Fluttertoast.showToast(msg: "Terjadi kesalahan saat login.");
    }
    return null;
  }

  Future<void> signout(BuildContext context) async {
    try {
      await _auth.signOut();
      await GoogleSignIn().signOut();
      Fluttertoast.showToast(msg: "Logout berhasil.");

      // Navigasi kembali ke halaman login setelah logout
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      log("Something went wrong: $e");
      Fluttertoast.showToast(msg: "Terjadi kesalahan saat logout.");
    }
  }
}
