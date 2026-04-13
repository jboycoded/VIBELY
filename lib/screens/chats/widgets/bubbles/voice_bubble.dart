// voice_bubble.dart

import 'package:flutter/material.dart';
import '../base_bubble.dart';
import '../../../../models/message_model.dart';

class VoiceBubble extends StatefulWidget {
  final MessageModel message;
  final bool isMe;
  final bool first;
  final bool last;

  const VoiceBubble({
    super.key,
    required this.message,
    required this.isMe,
    required this.first,
    required this.last,
  });

  @override
  State<VoiceBubble> createState() => _VoiceBubbleState();
}

class _VoiceBubbleState extends State<VoiceBubble> {
  double progress = 0.0;
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return BaseBubble(
      isMe: widget.isMe,
      timestamp: widget.message.timestamp,
      seen: widget.message.seenBy.isNotEmpty,
      isFirstInGroup: widget.first,
      isLastInGroup: widget.last,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              setState(() => isPlaying = !isPlaying);
            },
            child: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 120,
            child: Slider(
              value: progress,
              onChanged: (v) {
                setState(() => progress = v);
              },
            ),
          ),
        ],
      ),
    );
  }
}
