import 'dart:ui';
import 'package:flutter/material.dart';

class LocalPreview extends StatelessWidget {
  const LocalPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Container(
          width: 110,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white24),
          ),
          child: const Center(
            child: Icon(Icons.videocam, color: Colors.white54),
          ),
        ),
      ),
    );
  }
}
