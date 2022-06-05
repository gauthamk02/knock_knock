import 'package:flutter/material.dart';
import '../constants.dart';

class MyPasswordField extends StatelessWidget {
  const MyPasswordField({
    Key? key,
    required this.isPasswordVisible,
    required this.onTap,
    this.controller,
  }) : super(key: key);

  final bool isPasswordVisible;
  final VoidCallback onTap;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        style: kBodyText1.copyWith(
          color: Colors.white,
        ),
        controller: controller,
        obscureText: isPasswordVisible,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: onTap,
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
            ),
          ),
          contentPadding: EdgeInsets.all(20),
          hintText: 'Password',
          hintStyle: kBodyText1,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: kTextFieldBorder,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
