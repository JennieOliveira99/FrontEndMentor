import 'package:flutter/material.dart';

class CustomFontStyle {
  const CustomFontStyle();

  final TextStyle textTitleRegular = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 16,
    fontFamily: 'Karla',
  );

  final TextStyle textTitle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 28,
    fontFamily: 'Karla',
  );

  final TextStyle textTitleItalic = const TextStyle(
    fontStyle: FontStyle.italic,
    fontSize: 20,
    fontFamily: 'Karla',
  );
}
