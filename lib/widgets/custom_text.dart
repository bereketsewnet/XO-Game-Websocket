import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String data;
  final List<Shadow> shadows;
  final double fontSize;

  const CustomText({
    super.key,
    required this.data,
    required this.fontSize,
    required this.shadows,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        shadows: shadows,
      ),
    );
  }
}
