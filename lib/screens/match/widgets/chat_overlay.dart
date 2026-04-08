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
      height: 200, // Updated to match LiveChatSection height
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.05), // ✅ Styling from LiveChat
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListView.builder(
            controller: scrollController,
            reverse: true, // Keep latest at bottom like LiveChat
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
                // Updated to use the RichText style
                child: _chatStyle(messages[messages.length - 1 - index]),
              );
            },
          ),
        ),
      ),
    );
  }

  // New styling method copied from LiveChatSection
  Widget _chatStyle(String fullText) {
    // Assuming message format is "User: Message" 
    // If your messages list only contains the message, you can adjust this logic
    bool hasUser = fullText.contains(': ');
    String user = hasUser ? fullText.split(': ')[0] : "User";
    String message = hasUser ? fullText.split(': ')[1] : fullText;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$user: ",
              style: const TextStyle(
                  color: Colors.purpleAccent, // ✅ Styling from LiveChat
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: message,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
