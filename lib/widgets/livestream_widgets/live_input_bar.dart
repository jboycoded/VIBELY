import 'dart:ui';
import 'package:flutter/material.dart';

class LiveInputBar extends StatelessWidget {
  const LiveInputBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  "Say something...",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),

        _icon(Icons.emoji_emotions),
        const SizedBox(width: 8),
        _icon(Icons.card_giftcard),
      ],
    );
  }

  Widget _icon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}
