import 'dart:io';
import 'package:flutter/material.dart';
import '../base_bubble.dart';
import '../../../../models/message_model.dart';

class ImageBubble extends StatelessWidget {
  final MessageModel message;
  final bool isMe;
  final bool first;
  final bool last;

  const ImageBubble({
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.file(
          File(message.mediaUrl ?? ""),
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
