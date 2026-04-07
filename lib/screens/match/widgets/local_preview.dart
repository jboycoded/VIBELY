import 'package:flutter/material.dart';

class LocalPreview extends StatelessWidget {
  const LocalPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.pinkAccent, width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image.asset(
          'assets/images/streamer1.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
