import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  final double size; // Am făcut `size` final, deoarece nu pare să fie modificat ulterior.
  final String text;
  final Color color;

  const AppLargeText({
    super.key,
    this.size = 30, // Dimensiunea implicită
    required this.text, 
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
