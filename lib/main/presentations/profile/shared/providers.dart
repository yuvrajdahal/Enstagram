import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagramclone/login/shared/providers.dart';
import 'package:instagramclone/main/presentations/profile/application/profile_notifier.dart';

final profileNotifierProvider =
    StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  return ProfileNotifier(
    authNotifier: ref.watch(authNotifierProvider.notifier),
  );
});
