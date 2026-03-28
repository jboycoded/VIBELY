import 'package:flutter/material.dart';
import '../../widgets/chat_bubble.dart';

class PrivateChatScreen extends StatelessWidget {
  final String image;
  final String name;

  const PrivateChatScreen({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          /// 🔥 BACKGROUND (UNCHANGED STYLE)
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// 🔥 DARK OVERLAY
          Container(
            color: Colors.black.withOpacity(0.35),
          ),

          /// 🔥 MAIN CONTENT
          SafeArea(
            child: Column(
              children: [

                /// 🔥 UPDATED APP BAR (FROM YOUR OLD DESIGN + HERO)
                _buildAppBar(context),

                /// 🔥 CHAT MESSAGES (YOUR NEW SYSTEM)
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),

                    children: const [

                      ChatBubble(
                        message: "Hey, how’s your night going?",
                        isMe: true,
                        time: "10:10 PM",
                      ),

                      ChatBubble(
                        message:
                            "Hey Jenny! Pretty good so far, just relaxing at home.",
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

                /// 🔥 INPUT BAR (RESTORED STYLE)
                _buildInputBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 APP BAR (MERGED DESIGN)
  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),

      child: Row(
        children: [

          /// 🔙 BACK BUTTON
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),

          /// 🔥 HERO AVATAR (NEW FEATURE ADDED)
          Hero(
            tag: image,
            child: CircleAvatar(
              backgroundImage: AssetImage(image),
            ),
          ),

          const SizedBox(width: 10),

          /// 🔥 NAME + STATUS (OLD DESIGN)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),

              const Text(
                "Active 2 min ago",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 12,
                ),
              ),
            ],
          ),

          const Spacer(),

          /// 📞 CALL ICONS
          Icon(Icons.call, color: Colors.white.withOpacity(0.8)),
          const SizedBox(width: 12),
          Icon(Icons.videocam, color: Colors.white.withOpacity(0.8)),
        ],
      ),
    );
  }

  /// 🔹 INPUT BAR (FULLY RESTORED + FIXED)
  Widget _buildInputBar() {
    return Container(
      margin: const EdgeInsets.all(10),

      padding: const EdgeInsets.all(10),

      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(30),
      ),

      child: Row(
        children: [

          /// 🎤 MIC
          const Icon(Icons.mic, color: Colors.white70),

          const SizedBox(width: 10),

          /// ✍️ TEXT INPUT
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

          /// 📷 CAMERA
          const Icon(Icons.camera_alt, color: Colors.white70),

          const SizedBox(width: 10),

          /// 🚀 SEND BUTTON (GRADIENT RESTORED)
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color(0xFF9C27B0),
                  Color(0xFFE91E63),
                ],
              ),
            ),
            child: const Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
