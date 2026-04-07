import 'package:flutter/material.dart';

class ChatOverlay extends StatelessWidget {
  final List<String> messages;
  final ScrollController scrollController;

  const ChatOverlay({
    super.key,
    required this.messages,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        controller: scrollController,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return TweenAnimationBuilder(
            duration: const Duration(milliseconds: 300),
            tween: Tween(begin: 20.0, end: 0.0),
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(0, value),
                child: Opacity(
                  opacity: 1 - (value / 20),
                  child: child,
                ),
              );
            },
            child: _bubble(messages[index]),
          );
        },
      ),
    );
  }

  Widget _bubble(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
