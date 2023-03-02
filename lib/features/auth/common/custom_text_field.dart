import 'package:flutter/material.dart';

import 'login_container.dart';

class CustomTextFeild extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLine;
  final bool obsecure;
  final TextInputType textInputType;
  const CustomTextFeild({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLine = 1,
    this.obsecure = false,
    this.textInputType = TextInputType.emailAddress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginContainer(
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: controller,
        keyboardType: textInputType,
        obscureText: obsecure,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
        validator: (val) {
          if (val == null || val.isEmpty) {
            return '                                               Enter your $hintText';
          }
          return null;
        },
        maxLines: maxLine,
      ),
    );
  }
}
