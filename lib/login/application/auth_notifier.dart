import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagramclone/core/domain/user.dart';
import 'package:instagramclone/login/infrastructures/authenticator.dart';

enum AuthStatus { ideal, busy, failure, authenticated }

class AuthState {
  final AuthStatus status;
  final User? user;

  AuthState._({required this.status, this.user});

  factory AuthState.initial({AuthStatus status = AuthStatus.ideal}) =>
      AuthState._(status: status);

  factory AuthState.unauthenticated({required AuthStatus status}) =>
      AuthState._(status: status);

  factory AuthState.authenticated(
          {required User user, required AuthStatus status}) =>
      AuthState._(status: status, user: user);

  factory AuthState.failure() => AuthState._(
        status: AuthStatus.failure,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthState && other.status == status && other.user == user;
  }

  @override
  int get hashCode => status.hashCode ^ (user?.hashCode ?? 0);
}

class AuthNotifier extends StateNotifier<AuthState> {
  final Authenticator _authenticator;
  AuthNotifier(this._authenticator) : super(AuthState.initial());

  Future<void> checkAndUpdateAuthStatus() async {

    final user = await _authenticator.getSignedUser();
    state = (await _authenticator.isSigned)
        ? AuthState.authenticated(
            status: AuthStatus.authenticated,
            user: User(
              email: user.email,
              followers: user.followers,
              following: user.following,
              id: user.id,
              posts: user.posts,
              profilePicture: user.profilePicture,
            ),
          )
        : AuthState.unauthenticated(status: AuthStatus.failure);
  }

  Future<void> createGoogleAcount() async {
    final user = await _authenticator.signInUser();
    if (user != null) {
      state = AuthState.authenticated(
        status: AuthStatus.authenticated,
        user: User(
          email: user.email,
          followers: user.followers,
          following: user.following,
          id: user.id,
          posts: user.posts,
          profilePicture: user.profilePicture,
        ),
      );
    } else {
      state = AuthState.unauthenticated(status: AuthStatus.failure);
    }
  }
}
