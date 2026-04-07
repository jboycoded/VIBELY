import 'package:flutter/material.dart';

class VideoBackground extends StatelessWidget {
  const VideoBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        "assets/images/streamer1.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}

class DarkOverlay extends StatelessWidget {
  const DarkOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.black.withOpacity(0.3));
  }
}
