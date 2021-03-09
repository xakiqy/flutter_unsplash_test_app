import 'package:flutter/material.dart';

import 'colors.dart';

final ThemeData lightUnsplashTheme = _buildUnsplashTheme();

ThemeData _buildUnsplashTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: unsplashBrown900,
    primaryColor: unsplashPink100,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: unsplashPink100,
      colorScheme: base.colorScheme.copyWith(
        secondary: unsplashBrown900,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
        ),
        onPrimary: unsplashBrown900,
        primary: unsplashPink50,
        elevation: 8.0,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: unsplashBrown900,
      ),
    ),

    buttonBarTheme: base.buttonBarTheme.copyWith(
      buttonTextTheme: ButtonTextTheme.accent,
    ),
    scaffoldBackgroundColor: unsplashBackgroundWhite,
    cardColor: unsplashBackgroundWhite,
    textSelectionTheme:TextSelectionThemeData(selectionColor : unsplashPink100),
    errorColor: unsplashErrorRed,
    textTheme: _buildUnsplashTextTheme(base.textTheme),
    primaryTextTheme: _buildUnsplashTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildUnsplashTextTheme(base.accentTextTheme),
    primaryIconTheme: base.iconTheme.copyWith(color: unsplashBrown900),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: unsplashBrown900,
        ),
      ),
    ),

  );
}

TextTheme _buildUnsplashTextTheme(TextTheme base) {
  return base
      .copyWith(
    headline5: base.headline5!.copyWith(
      fontWeight: FontWeight.w500,
    ),
    headline6: base.headline6!.copyWith(fontSize: 18.0),
    caption: base.caption!.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    bodyText1: base.bodyText1!.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),
  )
      .apply(
    fontFamily: 'Rubik',
    displayColor: unsplashBrown900,
    bodyColor: unsplashBrown900,
  );
}