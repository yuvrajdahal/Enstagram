import 'package:flutter/material.dart';
import 'package:instagramclone/core/presentations/routes/app_router.dart';
import 'package:instagramclone/core/presentations/themes/app_themes.dart';

class AppWidget extends StatelessWidget {
  final appRouter = AppRouter();
  AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Gooddhan",
      routerConfig: appRouter.config(),
      theme: AppTheme.light(),
    );
  }
}
