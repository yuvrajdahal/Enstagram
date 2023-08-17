import 'package:flutter/material.dart';

Map<int, Color> color(int r, int g, int b) {
  return {
    50: Color.fromRGBO(r, g, b, .1),
    100: Color.fromRGBO(r, g, b, .2),
    200: Color.fromRGBO(r, g, b, .3),
    300: Color.fromRGBO(r, g, b, .4),
    400: Color.fromRGBO(r, g, b, .5),
    500: Color.fromRGBO(r, g, b, .6),
    600: Color.fromRGBO(r, g, b, .7),
    700: Color.fromRGBO(r, g, b, .8),
    800: Color.fromRGBO(r, g, b, .9),
    900: Color.fromRGBO(r, g, b, 1),
  };
}

MaterialColor primaryColorLight = MaterialColor(
  0xFFF7F7F7,
  color(115, 171, 255),
);
MaterialColor primaryColorDark = MaterialColor(
  0xffAD06EF,
  color(173, 6, 239),
);

class AppTheme {
  static TextTheme textThemeLight = const TextTheme(
    bodySmall: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    bodyMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    bodyLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    headlineLarge: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
  );

  static const appBarThemeLight = AppBarTheme(
    foregroundColor: Colors.black,
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 22,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
  );
  static final elevatedButtonThemeLight = ElevatedButtonThemeData(
    style: ButtonStyle(
        // shape: MaterialStateProperty.resolveWith((states) =>
        //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        foregroundColor: MaterialStateColor.resolveWith(
          (states) => Colors.black,
        ),
        textStyle: MaterialStateTextStyle.resolveWith(
            (states) => TextStyle(color: Colors.black))
        // textStyle: MaterialStateProperty.resolveWith((states) => const TextStyle(
        //   fontWeight:
        // ))
        ),
  );

  static ThemeData light() {
    return ThemeData(
      elevatedButtonTheme: elevatedButtonThemeLight,
      fontFamily: "Inter",
      brightness: Brightness.light,
      primarySwatch: primaryColorLight,
      iconTheme: const IconThemeData(size: 20),
      scaffoldBackgroundColor: const Color(0xffF8F8F8),
      appBarTheme: appBarThemeLight,
      primaryColor: primaryColorLight,
      textTheme: textThemeLight,
    );
  }

  /// Dark Theme
  ///
  static TextTheme textThemeDark = TextTheme(
    bodySmall: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: Colors.grey[400],
    ),
    bodyMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Colors.grey[300],
    ),
    headlineLarge: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  static final appBarThemeDark = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.grey[900],
    foregroundColor: Colors.white,
    titleTextStyle: const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
  );

  static ThemeData dark() {
    return ThemeData(
      // colorScheme: ThemeData().colorScheme.copyWith(
      //       secondary: primaryColorDark.shade200,
      //       brightness: Brightness.dark,
      //       primary: primaryColorDark,
      //       onSecondary: primaryColorDark.shade100,
      //       surface: primaryColorDark,
      //       background: Colors.white,
      //       onBackground: Colors.white,
      //     ),
      fontFamily: "Inter",
      primarySwatch: primaryColorDark,
      primaryColorDark: primaryColorDark,
      iconTheme: const IconThemeData(size: 20),
      scaffoldBackgroundColor: const Color(0xff1a1a1a),
      appBarTheme: appBarThemeDark,
      primaryColor: primaryColorDark,
      textTheme: textThemeDark,
    );
  }
}
