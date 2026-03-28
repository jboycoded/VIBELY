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

          /// BACKGROUND
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(color: Colors.black.withOpacity(0.4)),

          SafeArea(
            child: Column(
              children: [

                /// APP BAR WITH HERO
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),

                    Hero(
                      tag: image,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(image),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Text(
                      name,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),

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
            "Hey! Pretty good so far, just relaxing at home.",
        isMe: false,
        time: "10:12 PM",
      ),

      ChatBubble(
        message: "Wanna video chat? ❤️",
        isMe: true,
        time: "10:14 PM",
      ),

      ChatBubble(
        message: "Sure! Let’s do it 😊",
        isMe: false,
        time: "10:14 PM",
      ),
    ],
  ),
),

                /// INPUT BAR
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [

                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Type a message...",
                              hintStyle: TextStyle(color: Colors.white54),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      const Icon(Icons.send, color: Colors.purple),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
