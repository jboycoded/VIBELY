import 'package:flutter/material.dart';

class LocalPreview extends StatelessWidget {
  const LocalPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      right: 16,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 140,
          width: 100,
          color: Colors.black,
          child: Image.asset(
            "assets/images/streamer1.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
