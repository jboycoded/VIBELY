import 'package:flutter/material.dart';
import '../base_bubble.dart';
import '../../../../models/message_model.dart';

class TextBubble extends StatelessWidget {
  final MessageModel message;
  final bool isMe;
  final bool first;
  final bool last;

  const TextBubble({
    super.key,
    required this.message,
    required this.isMe,
    required this.first,
    required this.last,
  });

  @override
  Widget build(BuildContext context) {
    return BaseBubble(
      isMe: isMe,
      timestamp: message.timestamp,
      seen: message.seenBy.isNotEmpty,
      isFirstInGroup: first,
      isLastInGroup: last,
      replyText: message.replyText,
      reactions: message.reactions,
      child: Text(
        message.text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
