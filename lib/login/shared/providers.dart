import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:instagramclone/login/application/auth_notifier.dart';
import 'package:instagramclone/login/infrastructures/authenticator.dart';
import 'package:instagramclone/login/infrastructures/secure_storage.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});
final flutterStrorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});
final credentialProvider = Provider<SecureStorage>((ref) {
  return SecureStorage(ref.watch(flutterStrorageProvider));
});
final googleSignInProvider = Provider<GoogleSignIn>((ref) {
  return GoogleSignIn(
    signInOption: SignInOption.standard,
    scopes: ['email'],
  );
});
final authenticatorProvider = Provider<Authenticator>(
  (ref) {
    return Authenticator(
      googleSignIn: ref.watch(googleSignInProvider),
      dio: ref.watch(dioProvider),
      credentialStorage: ref.watch(credentialProvider),
    );
  },
);
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.watch(authenticatorProvider)),
);
