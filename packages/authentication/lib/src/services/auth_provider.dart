import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'services.dart';

abstract class AuthProvider {
  Future<void> initialize(FirebaseOptions? options);
  AuthUser? get currentUser;
  String? get userInfo;
  Future<AuthUser> logIn({
    required String email,
    required String password,
  });

  Future<AuthUser> createUser({
    required String email,
    required String password,
    required String confirmpassword,
  });

  Future<void> logOut();

  Future<User?> signInWithGoogle();

  Future<void> sendEmailVerification();
}
