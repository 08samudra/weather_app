import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
  });
  final String label;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 42,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              backgroundColor ??
              Colors.black, // Default to black if no color is provided
          foregroundColor:
              textColor ??
              Colors
                  .white, // Default text color to white for better contrast on black
        ),
        child: Text(label, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  const CustomButton2({
    super.key,
    required this.label,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
  });
  final String label;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 42,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.black, // Default to black
          foregroundColor:
              textColor ?? Colors.white, // Default text color to white
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/google.png", height: 16),
            const SizedBox(width: 8),
            Text(
              label.isNotEmpty ? label : "Login with Google",
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
