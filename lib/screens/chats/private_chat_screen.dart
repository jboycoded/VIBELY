import 'package:flutter/material.dart';

class PrivateChatScreen extends StatelessWidget {
  const PrivateChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background
          Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/login_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
            ),

    // DARK OVERLAY (makes text easier to read)
    Container(
      color: Colors.black.withOpacity(0.35),
    ),
          

          /// Main Content
          SafeArea(
            child: Column(
              children: [
                _buildAppBar(),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(12),
                    children: const [
                      ChatBubble(
                        message: "Hey, how’s your night going?",
                        isMe: true,
                        time: "10:10 PM",
                      ),
                      ChatBubble(
                        message:
                            "Hey Jenny! Pretty good so far, just relaxing at home. How about you?",
                        isMe: false,
                        time: "10:12 PM",
                      ),
                      ChatBubble(
                        message: "It's been good! Wanna video chat? ❤️",
                        isMe: true,
                        time: "10:14 PM",
                      ),
                      ChatBubble(
                        message: "Sure! Let's do it! 😊",
                        isMe: false,
                        time: "10:14 PM",
                      ),
                    ],
                  ),
                ),
                _buildInputBar(),
              ],
            ),
          ),
        ],
        ),
    );
  }

  /// 🔹 Top Bar
  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          const Icon(Icons.arrow_back, color: Colors.white),

          const SizedBox(width: 10),

          const CircleAvatar(
            backgroundImage: AssetImage("assets/streamer1.jpg"),
          ),

          const SizedBox(width: 10),

          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Jenny",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              Text("Active 2 min ago",
                  style: TextStyle(color: Colors.green, fontSize: 12)),
            ],
          ),

          const Spacer(),

          Icon(Icons.call, color: Colors.white.withOpacity(0.8)),
          const SizedBox(width: 12),
          Icon(Icons.videocam, color: Colors.white.withOpacity(0.8)),
        ],
      ),
    );
  }

  /// 🔹 Input Bar
  Widget _buildInputBar() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          const Icon(Icons.mic, color: Colors.white70),

          const SizedBox(width: 10),

          const Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Type a message...",
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
            ),
          ),

          const Icon(Icons.camera_alt, color: Colors.white70),

          const SizedBox(width: 10),

          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF9C27B0), Color(0xFFE91E63)],
              ),
            ),
            child: const Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

/// 🔹 Chat Bubble Widget
class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final String time;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isMe,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(vertical: 6),
            constraints: const BoxConstraints(maxWidth: 250),
            decoration: BoxDecoration(
              gradient: isMe
                  ? const LinearGradient(
                      colors: [Color(0xFF9C27B0), Color(0xFFE91E63)],
                    )
                  : null,
              color: isMe ? null : Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Text(
            time,
            style: const TextStyle(color: Colors.white54, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
