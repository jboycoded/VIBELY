import 'package:flutter/material.dart';

class InputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onGift;

  const InputBar({
    super.key,
    required this.controller,
    required this.onSend,
    required this.onGift,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Send a message...',
                hintStyle: TextStyle(color: Colors.white54),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: const Icon(Icons.card_giftcard, color: Colors.pinkAccent),
          onPressed: onGift,
        ),
        IconButton(
          icon: const Icon(Icons.send, color: Colors.white),
          onPressed: onSend,
        ),
      ],
    );
  }
}
