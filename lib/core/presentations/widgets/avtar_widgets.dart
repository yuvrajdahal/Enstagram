import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double radius;
  final List<Color> colors;
  final String src;
  final bool showBorder;
  final bool isAsset;
  const Avatar({
    super.key,
    required this.radius,
    required this.src,
    this.colors = const [
      Color.fromARGB(255, 252, 92, 92),
      Color.fromARGB(255, 227, 93, 93),
      Color(0xFFFCAF45),
      Color.fromARGB(166, 131, 58, 180),
    ],
    this.showBorder = true,
    this.isAsset = false,
  });

  @override
  Widget build(BuildContext context) {
    if (showBorder) {
      return GradientBorderAvtar(
          radius: radius, isAsset: isAsset, colors: colors, src: src);
    } else {
      return NoBorderAvtar(isAsset: isAsset, radius: radius, src: src);
    }
  }
}

class GradientBorderAvtar extends StatelessWidget {
  const GradientBorderAvtar({
    super.key,
    required this.radius,
    required this.colors,
    required this.src,
    required this.isAsset,
  });
  final bool isAsset;
  final double radius;
  final List<Color> colors;
  final String src;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      height: radius,
      width: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: colors),
      ),
      child: ClipOval(
        child: Container(
          padding: const EdgeInsets.all(3),
          color: Colors.white,
          child: ClipOval(
            child: src.isNotEmpty
                ? isAsset
                    ? Image(
                        fit: BoxFit.cover,
                        image: AssetImage(src),
                      )
                    : Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(src),
                      )
                : const Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/dummy.jpg'),
                  ),
          ),
        ),
      ),
    );
  }
}

class NoBorderAvtar extends StatelessWidget {
  const NoBorderAvtar({
    super.key,
    required this.radius,
    required this.src,
    required this.isAsset,
  });

  final double radius;
  final bool isAsset;
  final String src;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: radius,
      width: radius,
      child: ClipOval(
        child: Container(
          color: Colors.white,
          child: ClipOval(
            child: src.isNotEmpty
                ? isAsset
                    ? Image(
                        fit: BoxFit.cover,
                        image: AssetImage(src),
                      )
                    : Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(src),
                      )
                : const Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/dummy.jpg'),
                  ),
          ),
        ),
      ),
    );
  }
}
