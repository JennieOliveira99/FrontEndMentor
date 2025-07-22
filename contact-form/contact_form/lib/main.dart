import 'package:contact_form/responsive_form_page.dart';
import 'package:contact_form/src/widget/custom_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme().buildTheme(),
      home: const ResponsiveFormPage(),
    );
  }
}
