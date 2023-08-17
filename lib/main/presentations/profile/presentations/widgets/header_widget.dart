import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "yuvraj_dl",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.apply(fontWeightDelta: 2),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.add_box_outlined,
                size: 30,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.menu,
                size: 32,
              ),
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
