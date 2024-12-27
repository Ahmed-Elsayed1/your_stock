import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, FirebaseAuthException, GoogleAuthProvider, User;
import 'package:your_stock_core/your_stock_core.dart';
import 'package:your_stock_design_system/your_stock_design_system.dart';

import 'services.dart';

class FirebaseAuthProvider implements AuthProvider {
  FirebaseAuthProvider._firebaseAuthProvider();

  static final FirebaseAuthProvider instance =
      FirebaseAuthProvider._firebaseAuthProvider();

  GoogleSignIn? initializeGoogleSignin() => !kIsWeb ? GoogleSignIn() : null;

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
    required String confirmpassword,
  }) async {
    if (password == confirmpassword) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        final user = currentUser;
        if (user != null) {
          CloudDb.instance.createWatchList();
          return user;
        } else {
          throw UserNotLoggedInException();
        }
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case 'weak-password':
            throw WeakPasswordAuthException();
          case 'email-already-in-use':
            throw EmailAlreadyInUseAuthException();
          case 'invalid-email':
            throw InvalidEmailAuthException();
          default:
            throw GenericAuthException();
        }
      } catch (_) {
        throw GenericAuthException();
      }
    } else {
      throw DifferentConfirmPassword();
    }
  }

  @override
  AuthUser? get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    return user != null ? AuthUser.fromFirebase(user) : null;
  }

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = currentUser;
      if (user != null) {
        CloudDb.instance.createWatchList();
        return user;
      }
      throw UserNotLoggedInException();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw UserNotFoundAuthException();
        case 'wrong-password':
          throw UserNotFoundAuthException();
        case 'invalid-email':
          throw UserNotFoundAuthException();
        default:
          throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
  }

  @override
  Future<void> logOut() async {
    final user = FirebaseAuth.instance.currentUser;
    GoogleSignIn? googleSignIn = initializeGoogleSignin();
    if (googleSignIn != null) {
      if (await googleSignIn.isSignedIn()) {
        await googleSignIn.disconnect();
      }
    }
    if (user != null) {
      await FirebaseAuth.instance.signOut();
    } else {
      throw UserNotLoggedInException();
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
    } else {
      throw UserNotLoggedInException();
    }
  }

  @override
  Future<User?> signInWithGoogle() async {
    if (!kIsWeb) {
      try {
        // Trigger the authentication flow
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        // Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        // Once signed in, return the UserCredential
        final credentials =
            await FirebaseAuth.instance.signInWithCredential(credential);
        return credentials.user;
      } catch (e) {
        log('$e');
      }
    }
    return null;
  }

  Future<void> deleteUser() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
      if (!kIsWeb) {
        GoogleSignIn? googleSignIn = initializeGoogleSignin();
        if (await googleSignIn!.isSignedIn()) {
          await googleSignIn.disconnect();
        }
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'requires-recent-login':
          throw RequiresRecentLogin();
        default:
          throw GenericAuthException();
      }
    }
  }

  @override
  Future<void> initialize(FirebaseOptions? options) async {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(options: options);
    }
  }

  @override
  String? get userInfo => FirebaseAuth.instance.currentUser?.email;
}
