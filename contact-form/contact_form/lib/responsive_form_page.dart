import 'package:contact_form/form_page_desktop.dart';
import 'package:contact_form/form_page_mobile.dart';
import 'package:flutter/material.dart';

class ResponsiveFormPage extends StatelessWidget {
  const ResponsiveFormPage({super.key});

  bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  @override
  Widget build(BuildContext context) {
    return isMobile(context) ? const FormPageMobile() : const FormPageDesktop();
  }
}
