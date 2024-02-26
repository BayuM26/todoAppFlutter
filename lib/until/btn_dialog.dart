import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BtnDialog extends StatelessWidget {
  final String text;
  final Color color;
  VoidCallback onPressed;

  BtnDialog({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      child: Text(text),
    );
  }
}