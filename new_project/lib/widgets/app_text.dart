import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final double size; // Am făcut size final, deoarece nu se modifică după inițializare.
  final String text;
  final Color color;

  const AppText({
    super.key,
    this.size = 16, // Dimensiunea implicită
    required this.text,
    this.color = Colors.black54, // Culoarea implicită
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}
