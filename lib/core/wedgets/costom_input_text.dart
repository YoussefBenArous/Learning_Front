import 'package:flutter/material.dart';

class CustomInputText extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData prefixIcon;
  final bool? obscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CustomInputText({
    super.key,
    required this.label,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText,
    this.suffixIcon,
    this.controller,
    this.validator, required BorderRadius borderRadius,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        label: Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black,
          fontStyle: FontStyle.italic,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              25,
            ),
          ),
          borderSide: BorderSide(
            color: Colors.blueAccent,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            25,
          ),
          borderSide: BorderSide(
            color: Colors.blueAccent,
            width: 3,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              25,
            ),
          ),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              25,
            ),
          ),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.blueAccent,
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
