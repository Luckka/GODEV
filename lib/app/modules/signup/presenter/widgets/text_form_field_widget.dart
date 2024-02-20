import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool isPass;
  final String? Function(String?)? validator;
  const TextFormFieldWidget({super.key, required this.controller, required this.hintText, required this.keyboardType, this.isPass = false, required this.validator});

  @override
  Widget build(BuildContext context) {

    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context)
    );
    return TextFormField(
        controller: controller,
        decoration: InputDecoration(

            hintText:hintText,
            border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          filled: true,
          contentPadding: const EdgeInsets.all(8),

        ),

      keyboardType: keyboardType,
      obscureText: isPass,
      validator: validator,
    );
  }
}
