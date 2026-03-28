import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final String time;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isMe,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment:
          isMe ? Alignment.centerRight : Alignment.centerLeft,

      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),

        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),

        decoration: BoxDecoration(
          color: isMe
              ? const Color(0xFF9C27B0) // your purple
              : Colors.white.withOpacity(0.1),

          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft:
                isMe ? const Radius.circular(12) : Radius.zero,
            bottomRight:
                isMe ? Radius.zero : const Radius.circular(12),
          ),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),

            const SizedBox(height: 4),

            Text(
              time,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
