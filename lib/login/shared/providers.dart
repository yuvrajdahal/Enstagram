import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:instagramclone/login/application/auth_notifier.dart';
import 'package:instagramclone/login/infrastructures/authenticator.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});
final googleSignInProvider = Provider<GoogleSignIn>((ref) {
  return GoogleSignIn(
    signInOption: SignInOption.standard,
    scopes: ['email'],
  );
});
final authenticatorProvidr = Provider<Authenticator>(
  (ref) {
    return Authenticator(
      googleSignIn: ref.watch(googleSignInProvider),
      dio: ref.watch(dioProvider),
    );
  },
);
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.watch(authenticatorProvidr)),
);
