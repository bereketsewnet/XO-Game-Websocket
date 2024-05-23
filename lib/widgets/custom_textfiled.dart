import 'package:flutter/material.dart';
import 'package:tic_tok/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isReadOnly;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.blue,
          blurRadius: 5,
          spreadRadius: 2,
        ),
      ]),
      child: TextField(
        readOnly: isReadOnly,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: bgColor,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
