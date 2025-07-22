import 'package:contact_form/src/theme/custom_colors.dart';
import 'package:contact_form/src/theme/custom_font_style.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  ThemeData buildTheme() {
    final fontStyle = CustomFontStyle();

    return ThemeData(
      scaffoldBackgroundColor: CustomColors.primary,
      textTheme: TextTheme(
        headlineMedium: fontStyle.textTitle,
        titleMedium: fontStyle.textTitleRegular,
        bodyMedium: fontStyle.textTitleItalic,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.secondary1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.primaryDark, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.secondary1),
        ),
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        hintStyle: TextStyle(color: CustomColors.secondary2),
      ),
      primaryColor: CustomColors.primaryDark,
      colorScheme: ColorScheme.light(
        primary: CustomColors.primaryDark,
        secondary: CustomColors.secondary1,
      ),
      useMaterial3: true,
    ).copyWith(
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: CustomColors.primaryDark,
        selectionColor: CustomColors.primaryDark,
        selectionHandleColor: CustomColors.primaryDark,
      ),
    );
  }
}
