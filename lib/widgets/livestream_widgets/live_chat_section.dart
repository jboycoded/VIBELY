import 'dart:ui';
import 'package:flutter/material.dart';
import '../../models/comment.dart';

class LiveChatSection extends StatefulWidget {
  final List<CommentModel> comments;

  const LiveChatSection({
    super.key,
    required this.comments,
  });

  @override
  State<LiveChatSection> createState() => _LiveChatSectionState();
}

class _LiveChatSectionState extends State<LiveChatSection> {
  final ScrollController _scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant LiveChatSection oldWidget) {
    super.didUpdateWidget(oldWidget);

    /// 📌 Auto-scroll to latest message
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0, // because reverse: true
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
          ),

          /// 💬 EMPTY STATE
          child: widget.comments.isEmpty
              ? const Center(
                  child: Text(
                    "No messages yet...",
                    style: TextStyle(color: Colors.white54),
                  ),
                )

              /// 💬 CHAT LIST
              : ListView.builder(
                  controller: _scrollController,
                  reverse: true,
                  itemCount: widget.comments.length,
                  itemBuilder: (context, index) {
                    final comment = widget.comments[
                        widget.comments.length - 1 - index];

                    return _ChatBubble(comment: comment);
                  },
                ),
        ),
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final CommentModel comment;

  const _ChatBubble({required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "${comment.username}: ",
              style: const TextStyle(
                color: Colors.purpleAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: comment.message,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
