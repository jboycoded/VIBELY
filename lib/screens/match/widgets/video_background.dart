import 'package:flutter/material.dart';

class VideoBackground extends StatelessWidget {
  const VideoBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Image.asset(
        'assets/images/streamer1.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}

class DarkOverlay extends StatelessWidget {
  const DarkOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.2),
            Colors.black.withOpacity(0.6),
          ],
        ),
      ),
    );
  }
}
