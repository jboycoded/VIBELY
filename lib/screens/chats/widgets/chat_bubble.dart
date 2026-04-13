// chat_bubble.dart

import 'package:flutter/material.dart';
import '../../models/message_model.dart';
import 'bubbles/text_bubble.dart';
import 'bubbles/voice_bubble.dart';

class ChatBubble extends StatelessWidget {
  final MessageModel message;
  final bool isMe;
  final bool first;
  final bool last;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isMe,
    required this.first,
    required this.last,
  });

  @override
  Widget build(BuildContext context) {
    switch (message.type) {
      case MessageType.text:
        return TextBubble(
          message: message,
          isMe: isMe,
          first: first,
          last: last,
        );

      case MessageType.voice:
        return VoiceBubble(
          message: message,
          isMe: isMe,
          first: first,
          last: last,
        );

      case MessageType.image:
        return;

      case MessageType.gift:
        return;

      default:
        return const SizedBox();
    }
  }
}
