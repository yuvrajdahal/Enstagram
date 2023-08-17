import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Center(
            child: Image(
              image: AssetImage("assets/images/logo.png"),
              height: 60,
              width: 60,
            ),
          ),
          Positioned(
            bottom: 20,
            right: 0,
            left: 0,
            child: Center(
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 252, 92, 92),
                      Color.fromARGB(255, 227, 93, 93),
                      Color(0xFFFCAF45),
                      Color.fromARGB(166, 131, 58, 180),
                    ], // Define your gradient colors here
                    tileMode: TileMode.clamp,
                  ).createShader(bounds);
                },
                child: Text(
                  'Meta',
                  style: Theme.of(context).textTheme.bodyMedium?.apply(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
