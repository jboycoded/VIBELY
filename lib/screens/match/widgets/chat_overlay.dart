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
    return Positioned(
      left: 10,
      right: 10,
      bottom: 120,
      height: 180,
      child: ListView.builder(
        controller: scrollController,
        itemCount: messages.length,
        itemBuilder: (_, index) {
          return Text(
            messages[index],
            style: const TextStyle(color: Colors.white),
          );
        },
      ),
    );
  }
}
