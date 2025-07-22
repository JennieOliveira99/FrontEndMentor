import 'package:flutter/material.dart';
import 'package:contact_form/src/theme/custom_colors.dart';
import 'package:contact_form/src/widget/custom_elevated_button.dart';
import 'package:contact_form/src/widget/custom_title_text.dart';

enum QueryTypeOptions { generalEnquiry, supportRequest }

class FormPageMobile extends StatefulWidget {
  const FormPageMobile({super.key});

  @override
  State<FormPageMobile> createState() => _FormPageMobileState();
}

class _FormPageMobileState extends State<FormPageMobile> {
  QueryTypeOptions? _queryTypeOptions = QueryTypeOptions.generalEnquiry;
  bool? isChecked = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Container(
            decoration: BoxDecoration(
              color: CustomColors.secondary2,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(24),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTitleText(
                    text: 'Contact Us',
                    styleType: TitleTextStyle.bold,
                  ),
                  const SizedBox(height: 24),

                  CustomTitleText(text: 'First Name'),
                  const SizedBox(height: 4),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  CustomTitleText(text: 'Last Name'),
                  const SizedBox(height: 4),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  CustomTitleText(text: 'Email Address'),
                  const SizedBox(height: 4),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
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
                  const SizedBox(height: 24),

                  CustomTitleText(text: 'Query Type'),
                  const SizedBox(height: 8),

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: CustomColors.secondary1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Radio<QueryTypeOptions>(
                          value: QueryTypeOptions.generalEnquiry,
                          groupValue: _queryTypeOptions,
                          activeColor: CustomColors.primaryDark,
                          onChanged: (QueryTypeOptions? value) {
                            setState(() {
                              _queryTypeOptions = value;
                            });
                          },
                        ),
                        const SizedBox(width: 8),
                        CustomTitleText(text: 'General Enquiry'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: CustomColors.secondary1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Radio<QueryTypeOptions>(
                          value: QueryTypeOptions.supportRequest,
                          groupValue: _queryTypeOptions,
                          activeColor: CustomColors.primaryDark,
                          onChanged: (QueryTypeOptions? value) {
                            setState(() {
                              _queryTypeOptions = value;
                            });
                          },
                        ),
                        const SizedBox(width: 8),
                        CustomTitleText(text: 'Support Request'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  CustomTitleText(text: 'Message'),
                  const SizedBox(height: 4),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '',
                    ),
                    maxLines: 4,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your message';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: CustomTitleText(
                          text: 'I consent to being contacted by the team',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

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
          ),
        ),
      ),
    );
  }
}
