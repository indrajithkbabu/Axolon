import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color bgColor;
  final double height;
  final Color textColor;
  final BorderSide borderSide;
  final BorderRadius borderRadius;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.bgColor = Colors.blue,
    this.height = 50.0,
    this.textColor = Colors.white,
    this.borderSide = BorderSide.none,
    this.borderRadius = const BorderRadius.all(Radius.circular(15)),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        minimumSize: Size(double.infinity, height),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: borderSide,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}