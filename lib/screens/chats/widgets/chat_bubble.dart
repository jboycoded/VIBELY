import 'package:flutter/material.dart';
import '../models/message_model.dart';
import '../services/audio_player_service.dart';

class ChatBubble extends StatefulWidget {
  final MessageModel message;
  final bool isMe;
  final Function(String emoji)? onReact;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isMe,
    this.onReact,
  });

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {

  final player = AudioPlayerService();
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: _showReactions,
      child: Align(
        alignment:
            widget.isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: widget.isMe
                    ? const Color(0xFF9C27B0)
                    : Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12),
                  bottomLeft:
                      widget.isMe ? const Radius.circular(12) : Radius.zero,
                  bottomRight:
                      widget.isMe ? Radius.zero : const Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  _buildContent(),

                  const SizedBox(height: 4),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Text(
                        _formatTime(widget.message.timestamp),
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 10,
                        ),
                      ),

                      const SizedBox(width: 4),

                      if (widget.isMe)
                        Icon(
                          widget.message.seenBy.isNotEmpty
                              ? Icons.done_all
                              : Icons.check,
                          size: 12,
                          color: widget.message.seenBy.isNotEmpty
                              ? Colors.blue
                              : Colors.white54,
                        ),
                    ],
                  ),
                ],
              ),
            ),

            /// ❤️ REACTIONS DISPLAY
            if (widget.message.reactions.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: widget.message.reactions.values
                      .map((e) => Text(e))
                      .toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (widget.message.type) {

      case MessageType.text:
        return Text(widget.message.text,
            style: const TextStyle(color: Colors.white));

      case MessageType.image:
        return Image.asset(widget.message.mediaUrl ?? "");

      case MessageType.voice:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            GestureDetector(
              onTap: _togglePlay,
              child: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
              ),
            ),

            const SizedBox(width: 6),

            Container(
              width: 100,
              height: 4,
              color: Colors.white54,
            ),

            const SizedBox(width: 6),

            Text(
              "${widget.message.voiceDuration?.inSeconds ?? 0}s",
              style: const TextStyle(color: Colors.white),
            ),
          ],
        );

      case MessageType.gift:
        return Row(
          children: [
            const Text("🎁"),
            Text(widget.message.text),
          ],
        );
    }
  }

  void _togglePlay() async {
    if (isPlaying) {
      await player.stop();
    } else {
      await player.play(widget.message.mediaUrl!);
    }

    setState(() => isPlaying = !isPlaying);
  }

  void _showReactions() {
    showModalBottomSheet(
      context: context,
      builder: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: ["❤️", "🔥", "😂", "😮", "👏"].map((emoji) {
          return GestureDetector(
            onTap: () {
              widget.onReact?.call(emoji);
              Navigator.pop(context);
            },
            child: Text(emoji, style: const TextStyle(fontSize: 28)),
          );
        }).toList(),
      ),
    );
  }

  String _formatTime(DateTime time) {
    final diff = DateTime.now().difference(time);

    if (diff.inMinutes < 1) return "Now";
    if (diff.inMinutes < 60) return "${diff.inMinutes}m";

    return "${diff.inHours}h";
  }
}
