import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String inputText;
  const CustomText({
    super.key,
    required this.inputText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      inputText,
      style: const TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
