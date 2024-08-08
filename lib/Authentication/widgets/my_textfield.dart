import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  //final controller;
  final String labelText;
  final bool obscureText;
  final controller;
  final TextInputType? keyboardType;
  const MyTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.obscureText,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 250.0),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          // enabledBorder: const OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.white),
          // ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey.shade500),
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please $labelText';
          }

          return null;
        },
      ),
    );
  }
}
