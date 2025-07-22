import 'package:flutter/material.dart';

enum TitleTextStyle { regular, bold, italic }

class CustomTitleText extends StatelessWidget {
  final String text;
  final TitleTextStyle styleType;

  const CustomTitleText({
    super.key,
    required this.text,
    this.styleType = TitleTextStyle.regular,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    TextStyle style;
    switch (styleType) {
      case TitleTextStyle.regular:
        style = textTheme.titleMedium ?? const TextStyle();
        break;
      case TitleTextStyle.italic:
        style = textTheme.bodyMedium ?? const TextStyle();
        break;
      case TitleTextStyle.bold:
      default:
        style = textTheme.headlineMedium ?? const TextStyle();
    }

    return Text(text, style: style);
  }
}
