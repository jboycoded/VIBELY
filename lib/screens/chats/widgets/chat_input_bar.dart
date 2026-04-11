import 'package:flutter/material.dart';

class ChatInputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onImage;
  final VoidCallback onVoice;

  const ChatInputBar({
    super.key,
    required this.controller,
    required this.onSend,
    required this.onImage,
    required this.onVoice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [

          GestureDetector(
            onTap: onVoice,
            child: const Icon(Icons.mic, color: Colors.white70),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Type a message...",
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
            ),
          ),

          GestureDetector(
            onTap: onImage,
            child: const Icon(Icons.camera_alt, color: Colors.white70),
          ),

          const SizedBox(width: 10),

          GestureDetector(
            onTap: onSend,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFF9C27B0), Color(0xFFE91E63)],
                ),
              ),
              child: const Icon(Icons.send, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
