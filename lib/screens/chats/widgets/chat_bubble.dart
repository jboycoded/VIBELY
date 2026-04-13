import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart';

import '../../../models/message_model.dart';
import '../../../services/audio_player_service.dart';

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
        child: Row(
        children: [
          if(widget.isMe)
            const SizedBox(width: 50),
          Column(
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
          if(!widget.isMe)
            const SizedBox(width: 50),
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
  return ClipRRect(
    borderRadius: BorderRadius.circular(8), // Optional: rounds the corners
    child: Image.file(
      width: 100,
      height: 100,
      File(widget.message.mediaUrl ?? ""),
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
    ),
  );
        case MessageType.voice:
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      // 4. User Avatar (WhatsApp style often shows the sender's pic here)
      const CircleAvatar(
        radius: 14,
        backgroundColor: Colors.white12,
        child: Icon(Icons.mic, size: 16, color: Colors.white),
      ),
      // 1. Play/Pause Button with a Circle background
      GestureDetector(
        onTap: _togglePlay,
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            color: Colors.white24, // Subtle circle background
            shape: BoxShape.circle,
          ),
          child: Icon(
            isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),

      const SizedBox(width: 8),

      // 2. The Seek Bar / Progress Line
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                // Background Track
                Container(
                  width: 150, // Set a fixed max width for the bubble
                  height: 3,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                // Active Progress (Changes based on playback)
                Container(
                  width: 150 * 0.5, //currentProgress, // currentProgress is 0.0 to 1.0
                  height: 3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                // Draggable Knob (Optional)
              ],
            ),
            const SizedBox(height: 4),
            
            // 3. Duration Text
            Text(
              isPlaying ? "1s" : "${widget.message.voiceDuration?.inSeconds ?? 0}s",
              //_formatDuration(currentPosition) : "${widget.message.voiceDuration?.inSeconds ?? 0}s",
              style: const TextStyle(color: Colors.white70, fontSize: 11),
            ),
          ],
        ),
      ),
      
      const SizedBox(width: 8),
    ],
  );
        
      /*
      case MessageType.voice:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            ///TODO: COME TO THIS ONE LATER 
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
        */

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

  /*
  String _formatDuration(Duration? duration) {
  if (duration == null) return "0:00";

  // Get minutes and the remaining seconds
  String minutes = duration.inMinutes.toString();
  
  // .padLeft(2, '0') ensures 5 seconds becomes "05"
  String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');

  return "$minutes:$seconds";
  }
  */
  

  String _formatTime(DateTime time) {
    // 'h:mm' = 12-hour format with minutes
  // 'a'    = AM/PM marker
  return DateFormat('h:mm a').format(time);
  
    /*final diff = DateTime.now().difference(time);

    if (diff.inMinutes < 1) return "Now";
    if (diff.inMinutes < 60) return "${diff.inMinutes}m";
    if (diff.inHours < 24) return "${diff.inHours}h";
  if (diff.inDays < 7) return "${diff.inDays}d";

  return "${(diff.inDays / 7).floor()}w";
  */
  }
}
