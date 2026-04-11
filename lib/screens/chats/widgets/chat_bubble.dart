import 'package:flutter/material.dart';
import '../models/message_model.dart';

class ChatBubble extends StatelessWidget {
  final MessageModel message;
  final bool isMe;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isMe,
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
              ? const Color(0xFF9C27B0)
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

            /// 💬 MESSAGE CONTENT
            _buildContent(),

            const SizedBox(height: 4),

            /// ⏱ TIME + STATUS
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                Text(
                  _formatTime(message.timestamp),
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 10,
                  ),
                ),

                const SizedBox(width: 4),

                /// ✅ STATUS (only for sender)
                if (isMe)
                  Icon(
                    _statusIcon(message.status),
                    size: 12,
                    color: Colors.white54,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 HANDLE DIFFERENT MESSAGE TYPES (FUTURE-PROOF)
  Widget _buildContent() {
    switch (message.type) {
      case MessageType.text:
        return Text(
          message.text,
          style: const TextStyle(color: Colors.white),
        );

      case MessageType.gift:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("🎁 ", style: TextStyle(fontSize: 18)),
            Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        );

      case MessageType.image:
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            message.text, // assuming path
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
        );
    }
  }

  /// 🔹 TIME FORMATTER
  String _formatTime(DateTime time) {
    final diff = DateTime.now().difference(time);

    if (diff.inMinutes < 1) return "Now";
    if (diff.inMinutes < 60) return "${diff.inMinutes}m";
    if (diff.inHours < 24) return "${diff.inHours}h";

    return "${time.day}/${time.month}";
  }

  /// 🔹 MESSAGE STATUS ICON
  IconData _statusIcon(MessageStatus status) {
    switch (status) {
      case MessageStatus.sending:
        return Icons.access_time;
      case MessageStatus.sent:
        return Icons.check;
      case MessageStatus.delivered:
        return Icons.done_all;
      case MessageStatus.seen:
        return Icons.done_all;
    }
  }
}
