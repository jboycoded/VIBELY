import 'package:flutter/material.dart';

class TypingIndicator extends StatelessWidget {
  const TypingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        SizedBox(width: 12),
        Text(
          "Typing...",
          style: TextStyle(color: Colors.white54, fontSize: 12),
        ),
      ],
    );
  }
}
