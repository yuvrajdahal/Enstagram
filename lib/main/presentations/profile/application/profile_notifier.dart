import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagramclone/core/domain/user.dart';
import 'package:instagramclone/login/application/auth_notifier.dart';

enum ProfileStatus {
  fetched,
  loading,
  ideal,
}

class ProfileState {
  final ProfileStatus status;
  final User? user;
  ProfileState._({required this.status, this.user});

  factory ProfileState.initial() => ProfileState._(status: ProfileStatus.ideal);
  factory ProfileState.loading() =>
      ProfileState._(status: ProfileStatus.loading);

  factory ProfileState.success(
          {required user, required ProfileStatus status}) =>
      ProfileState._(status: status, user: user);
}

class ProfileNotifier extends StateNotifier<ProfileState> {
  final AuthNotifier _authNotifier;
  ProfileNotifier({required AuthNotifier authNotifier})
      : _authNotifier = authNotifier,
        super(ProfileState.initial());
  void loadUser() async {
    if (mounted) {
      state = ProfileState.loading();
      switch (_authNotifier.state.status) {
        case AuthStatus.authenticated:
          state = ProfileState.success(
              user: (_authNotifier.state).user, status: ProfileStatus.fetched);
          break;
        default:
          state = ProfileState.initial();
      }
    }
  }
}
