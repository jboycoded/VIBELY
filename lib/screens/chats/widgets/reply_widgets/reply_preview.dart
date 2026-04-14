import 'package:flutter/material.dart';

class ReplyPreview extends StatelessWidget {
  final String text;
  final bool isMe;
  final VoidCallback? onTap;

  const ReplyPreview({
    super.key,
    required this.text,
    required this.isMe,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: isMe ? Colors.purple : Colors.grey,
              width: 3,
            ),
          ),
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}
