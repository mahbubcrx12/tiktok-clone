import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktolk_clone/constants.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final bool isObscure;
  const TextInputField({Key? key,
    required this.controller,
    required this.icon,
     this.isObscure=false,
    required this.labelText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextField(
        controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        labelStyle: const TextStyle(fontSize: 25),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: borderColor,
          )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: borderColor,
            )
        ),

      ),
      obscureText: isObscure,
    );
  }
}
