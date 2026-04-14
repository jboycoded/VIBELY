import 'package:flutter/material.dart';
import '../../../models/message_model.dart';

class ChatInputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onImage;
  final VoidCallback onVoiceStart;
  final VoidCallback onVoiceEnd;
  final bool isRecording;

  final MessageModel? replyingTo;
  final VoidCallback? onCancelReply;

  const ChatInputBar({
    super.key,
    required this.controller,
    required this.onSend,
    required this.onImage,
    required this.onVoiceStart,
    required this.onVoiceEnd,
    required this.isRecording,
    this.replyingTo,
    this.onCancelReply,
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
      child: Column(
      children: [

        if (replyingTo != null)
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.black54,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    replyingTo!.text,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: onCancelReply,
                )
              ],
            ),
          ),
          Row(
        children: [

          GestureDetector(
  onLongPressStart: (_) => onVoiceStart(),
  onLongPressEnd: (_) => onVoiceEnd(),
  child: Icon(
    isRecording ? Icons.mic : Icons.mic_none,
    color: isRecording ? Colors.red : Colors.white70,
  ),
),

          const SizedBox(width: 10),

          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),
              textCapitalization: TextCapitalization.sentences,
              maxLines: 5,
              minLines: 1,
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
        ]
        ),
    );
  }
}
