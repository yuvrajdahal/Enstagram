import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagramclone/core/presentations/widgets/avtar_widgets.dart';
import 'package:instagramclone/core/shared/constants.dart';
import 'package:instagramclone/login/shared/providers.dart';

@RoutePage()
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void registerWithGoogleAccount() async {
      final authNotifier = ref.read(authNotifierProvider.notifier);
      return authNotifier.createGoogleAcount();
    }

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(paddingValue),
          child: Column(
            children: [
              const SizedBox(
                height: paddingValue * 6,
              ),
              const Center(
                child: Image(
                  image: AssetImage(
                    'assets/images/logo.png',
                  ),
                  height: 80,
                  width: 80,
                ),
              ),
              const SizedBox(
                height: paddingValue * 2,
              ),
              const Avatar(
                radius: 140,
                src: 'assets/images/yuvraj.jpeg',
                showBorder: false,
                isAsset: true,
              ),
              const SizedBox(
                height: paddingValue * 2,
              ),
              Text(
                "yuvrajdl",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: paddingValue * 5,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: registerWithGoogleAccount,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue[800],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(paddingValue * 1.5),
                    child: Text(
                      'Login',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.apply(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              const Center(
                child: Column(
                  children: [
                    Text('Create new account'),
                    Text('Meta'),
                  ],
                ),
              ),
              const SizedBox(
                height: paddingValue * 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
