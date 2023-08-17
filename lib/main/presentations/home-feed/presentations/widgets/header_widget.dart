import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Enstagram",
          style: GoogleFonts.pacifico(fontSize: 22),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.favorite_outline,
                size: 28,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.chat_bubble_outline_outlined,
                size: 25,
              ),
              onPressed: () {},
            )
          ],
        )
      ],
    );
  }
}
