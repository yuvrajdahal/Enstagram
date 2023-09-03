import 'dart:convert';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:dio/dio.dart';
import 'package:instagramclone/core/domain/user.dart';
import 'package:instagramclone/core/shared/constants.dart';
import 'package:instagramclone/login/infrastructures/secure_storage.dart';

class Authenticator {
  final GoogleSignIn _googleSignIn;
  final Dio _dio;
  final CredentialStorage _credentialStorage;
  Authenticator(
      {required GoogleSignIn googleSignIn,
      required Dio dio,
      required CredentialStorage credentialStorage})
      : _googleSignIn = googleSignIn,
        _dio = dio,
        _credentialStorage = credentialStorage;

  Future<bool> get isSigned {
    return _credentialStorage.read("token").then((token) => token != null);
  }

  // Future<String?> getSignedCredentials(String key) async {
  //   try {
  //     final storedCredentials = await _credentialStorage.read(key);
  //     if (storedCredentials != null) return storedCredentials;
  //   } on PlatformException {
  //     return null;
  //   }
  // }

  Future<User> getSignedUser() async {
    final storedUser = await _credentialStorage.read("user");
    User user = User.fromJson(json.decode(storedUser));
    return user;
  }

  Future<User?> signInUser() async {
    try {
      final signInAcc = await _googleSignIn.signIn();
      if (signInAcc == null) return null;
      final googleSignInAuth = await signInAcc.authentication;
      final res = await _dio.post(
        '$baseUrl/auth',
        data: json.encode(
          {
            "token": googleSignInAuth.idToken,
            'email': signInAcc.email,
          },
        ),
      );
      final resData = res.data as Map<String, dynamic>;

      _credentialStorage.store("token", resData["token"]);
      User user = User.fromJson(resData["user"]);

      _credentialStorage.store("user", json.encode(user.toJson()));

      return user;
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}
