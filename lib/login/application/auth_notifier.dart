import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagramclone/login/infrastructures/authenticator.dart';

enum AuthStatus { ideal, busy }

class AuthState {
  final AuthStatus? status;
  final User? user;
  final AuthFailure? failure;

  AuthState.initial({this.status = AuthStatus.ideal, this.user, this.failure});
  AuthState.unauthenticated({
    this.status = AuthStatus.ideal,
    this.user,
    this.failure,
  });

  AuthState.authenticated({
    this.status = AuthStatus.ideal,
    required this.user,
    this.failure,
  });

  AuthState.failure({
    required this.failure,
    this.status = AuthStatus.ideal,
    this.user,
  });
}

class AuthFailure {
  final String message;

  AuthFailure(this.message);

  @override
  String toString() => 'AuthFailure: $message';
}

class User {}

class AuthNotifier extends StateNotifier<AuthState> {
  final Authenticator _authenticator;
  AuthNotifier(this._authenticator) : super(AuthState.initial());

  Future<void> createGoogleAcount(callBack) async {
    final user = await _authenticator.signInUser();
    callBack(user);
  }
}
