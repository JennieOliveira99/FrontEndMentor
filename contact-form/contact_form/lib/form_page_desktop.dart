import 'package:contact_form/src/theme/custom_colors.dart';
import 'package:contact_form/src/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import './src/widget/custom_title_text.dart';

class FormPageDesktop extends StatefulWidget {
  const FormPageDesktop({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FormPageDesktopState createState() => _FormPageDesktopState();
}

enum QueryTypeOptions { generalEnquiry, supportRequest }

class _FormPageDesktopState extends State<FormPageDesktop> {
  QueryTypeOptions? _queryTypeOptions = QueryTypeOptions.generalEnquiry;
  bool? isChecked = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primary,
      body: Padding(
        padding: EdgeInsets.all(64),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 750, maxHeight: 790),
            child: Container(
              decoration: BoxDecoration(
                color: CustomColors.secondary2,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTitleText(
                    text: 'Contact Us',
                    styleType: TitleTextStyle.bold,
                  ),
                  SizedBox(height: 16),
                  Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTitleText(text: 'First Name'),
                                  SizedBox(height: 2),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: '',
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Please enter your first name';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 24),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTitleText(text: 'Last Name'),
                                  SizedBox(height: 2),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: '',
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Please enter your last name';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTitleText(text: 'Email Adress'),
                                  SizedBox(height: 2),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: '',
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Please enter your email address';
                                      }
                                      final emailRegex = RegExp(
                                        r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                                      );
                                      if (!emailRegex.hasMatch(value)) {
                                        return 'Please enter a valid email';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        CustomTitleText(text: 'Query Type'),
                        SizedBox(height: 2),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: CustomColors.secondary1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    padding: EdgeInsets.all(6),
                                    child: Row(
                                      children: [
                                        Radio<QueryTypeOptions>(
                                          value:
                                              QueryTypeOptions.generalEnquiry,
                                          groupValue: _queryTypeOptions,
                                          activeColor: CustomColors.primaryDark,
                                          onChanged: (QueryTypeOptions? value) {
                                            setState(() {
                                              _queryTypeOptions = value;
                                            });
                                          },
                                        ),
                                        SizedBox(width: 4),
                                        CustomTitleText(
                                          text: 'General Enquiry',
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 24),
                                ],
                              ),
                            ),
                            SizedBox(width: 24),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: CustomColors.secondary1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    padding: EdgeInsets.all(6),
                                    child: Row(
                                      children: [
                                        Radio<QueryTypeOptions>(
                                          value:
                                              QueryTypeOptions.supportRequest,
                                          groupValue: _queryTypeOptions,
                                          activeColor: CustomColors.primaryDark,
                                          onChanged: (QueryTypeOptions? value) {
                                            setState(() {
                                              _queryTypeOptions = value;
                                            });
                                          },
                                        ),
                                        SizedBox(width: 4),
                                        CustomTitleText(
                                          text: 'Support Request',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTitleText(text: 'Message'),
                                  SizedBox(height: 2),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: '',
                                    ),
                                    maxLines: 3,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Please enter your message';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 32),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                  ),
                                  SizedBox(width: 4),
                                  CustomTitleText(
                                    text:
                                        'I consent to being contacted by the team',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 32),
                        CustomElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (!isChecked!) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'You must consent to be contacted.',
                                    ),
                                  ),
                                );
                                return;
                              }

                              // send form
                            }
                          },
                          text: 'Submit',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
