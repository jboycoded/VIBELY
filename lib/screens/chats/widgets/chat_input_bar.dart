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
    return Column(
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

            IconButton(
              icon: const Icon(Icons.image),
              onPressed: onImage,
            ),

            Expanded(
              child: TextField(
                controller: controller,
                decoration:
                    const InputDecoration(hintText: "Message"),
              ),
            ),

            GestureDetector(
              onLongPress: onVoiceStart,
              onLongPressUp: onVoiceEnd,
              child: Icon(
                isRecording ? Icons.mic : Icons.send,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
