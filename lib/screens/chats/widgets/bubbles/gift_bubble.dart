import 'package:flutter/material.dart';
import '../base_bubble.dart';
import '../../../../models/message_model.dart';

class GiftBubble extends StatelessWidget {
  final MessageModel message;
  final bool isMe;
  final bool first;
  final bool last;

  const GiftBubble({
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("🎁"),
          const SizedBox(width: 6),
          Text(message.text),
        ],
      ),
    );
  }
}
