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
          return _bubble(messages[index]);
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
      child: Text(text),
    );
  }
}
