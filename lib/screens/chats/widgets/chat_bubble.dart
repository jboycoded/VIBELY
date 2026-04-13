import 'package:flutter/material.dart';
import '../../../models/message_model.dart';
import 'bubbles/text_bubble.dart';
import 'bubbles/image_bubble.dart';
import 'bubbles/voice_bubble.dart';
import 'bubbles/gift_bubble.dart';

class ChatBubble extends StatelessWidget {
  final MessageModel message;
  final bool isMe;
  final bool first;
  final bool last;
  final Function(MessageModel)? onReply;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isMe,
    required this.first,
    required this.last,
    this.onReply,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (_) {
        onReply?.call(message);
      },
      onLongPress: () {
        // reaction picker
      },
      child: _build(),
    );
  }

  Widget _build() {
    switch (message.type) {
      case MessageType.text:
        return TextBubble(
          message: message,
          isMe: isMe,
          first: first,
          last: last,
        );

      case MessageType.image:
        return ImageBubble(
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

      case MessageType.gift:
        return GiftBubble(
          message: message,
          isMe: isMe,
          first: first,
          last: last,
        );
    }
  }
}
