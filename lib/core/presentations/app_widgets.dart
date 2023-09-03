import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagramclone/core/domain/user.dart';
import 'package:instagramclone/core/presentations/routes/app_router.dart';
import 'package:instagramclone/core/presentations/themes/app_themes.dart';
import 'package:instagramclone/login/application/auth_notifier.dart';
import 'package:instagramclone/login/infrastructures/secure_storage.dart';
import 'package:instagramclone/login/shared/providers.dart';

final initializationProvider = FutureProvider<void>((ref) async {
  final authNotifier = ref.read(authNotifierProvider.notifier);

  await authNotifier.checkAndUpdateAuthStatus();
});

class AppWidget extends ConsumerWidget {
  final appRouter = AppRouter();
  AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initializationProvider, (_, __) {});

    // ref.listen<AuthState>(
    //   authNotifierProvider,
    //   (previous, next) {
    //     if (next.status == AuthStatus.authenticated) {
    //       appRouter.pushAndPopUntil(
    //         const MainRoute(),
    //         predicate: (route) => false,
    //       );
    //     }
    //     if (next.status == AuthStatus.failure) {
    //       appRouter.pushAndPopUntil(
    //         const LoginRoute(),
    //         predicate: (route) => false,
    //       );
    //     }
    //     // if (next.status == AuthStatus.busy) {
    //     //   return CircularProgressIndicator();
    //     // }
    //   },
    // );
    final authSate = ref.watch<AuthState>(authNotifierProvider);

    if (authSate.status == AuthStatus.authenticated) {
      appRouter.pushAndPopUntil(
        const MainRoute(),
        predicate: (route) => false,
      );
    }
    if (authSate.status == AuthStatus.failure) {
      appRouter.pushAndPopUntil(
        const LoginRoute(),
        predicate: (route) => false,
      );
    }
    if (authSate.status == AuthStatus.busy) {
      return const CircularProgressIndicator();
    }
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Gooddhan",
      routerConfig: appRouter.config(),
      theme: AppTheme.light(),
    );
  }
}
