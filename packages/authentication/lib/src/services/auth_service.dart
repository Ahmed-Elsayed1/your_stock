import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
import 'package:firebase_core/firebase_core.dart';

import 'services.dart';

class AuthService implements AuthProvider {
  final AuthProvider provider;
  const AuthService(this.provider);

  factory AuthService.firebase() => AuthService(FirebaseAuthProvider());

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
    required String confirmpassword,
  }) =>
      provider.createUser(
        email: email,
        password: password,
        confirmpassword: confirmpassword,
      );

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) =>
      provider.logIn(
        email: email,
        password: password,
      );

  @override
  Future<void> logOut() => provider.logOut();

  @override
  Future<User?> signInWithGoogle() => provider.signInWithGoogle();

  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();

  @override
  Future<void> initialize(FirebaseOptions? options) => provider.initialize(options);

  @override
  String? get userInfo => provider.userInfo;
}
