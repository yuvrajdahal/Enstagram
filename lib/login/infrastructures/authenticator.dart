import 'dart:convert';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:dio/dio.dart';
import 'package:instagramclone/core/shared/constants.dart';

class Authenticator {
  final GoogleSignIn _googleSignIn;
  final Dio _dio;

  Authenticator({
    required GoogleSignIn googleSignIn,
    required Dio dio,
  })  : _googleSignIn = googleSignIn,
        _dio = dio;

  Future signInUser() async {
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
      return resData["data"];
    } catch (e) {
      throw Exception(e);
    }
  }
}
