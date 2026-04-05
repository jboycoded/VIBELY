import 'dart:ui';
import 'package:flutter/material.dart';

class LiveChatSection extends StatelessWidget {
  const LiveChatSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _chat("Johnson", "joined"),
              _chat("successful", "good morning"),
              _chat("Anna", "you look amazing 😍"),
            ],
          ),
        ),
      ),
    );
  }
}

class _chat extends StatelessWidget {
  final String user;
  final String message;

  const _chat(this.user, this.message);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$user: ",
              style: const TextStyle(
                  color: Colors.purpleAccent,
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: message,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
