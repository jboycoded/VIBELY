import 'package:flutter/material.dart';

import 'private_chat_screen.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Stack(
        children: [

          /// BACKGROUND IMAGE
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// DARK OVERLAY
          Container(
            color: Colors.black.withOpacity(0.5),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:16),

              child: Column(
                children: [

                  /// TOP BAR
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [

                      Icon(Icons.person, color: Colors.white),

                      Text(
                        "Messages",
                        style: TextStyle(color: Colors.white,fontSize:18),
                      ),

                      Icon(Icons.search, color: Colors.white),
                    ],
                  ),

                  const SizedBox(height:20),

                  /// SEARCH BAR
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal:12),
                    height: 45,

                    decoration: BoxDecoration(
                      color: const Color(0xFF1B1534),
                      borderRadius: BorderRadius.circular(25),
                    ),

                    child: const Row(
                      children: [
                        Icon(Icons.search,color: Colors.white54),
                        SizedBox(width:10),
                        Text(
                          "Search messages/calls...",
                          style: TextStyle(color: Colors.white54),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height:20),

                  /// CHAT LIST
                  Expanded(
                    child: ListView(
                      children: const [

                        ChatItem(
                          name: "Jenny",
                          message: "Wanna video chat? ❤️",
                          time: "5 mins ago",
                          image: "assets/images/stream1.jpg",
                          unread: true,
                        ),

                        ChatItem(
                          name: "Lisa",
                          message: "Now Finn told you fixed the pic!",
                          time: "15 m",
                          image: "assets/images/stream2.jpg",
                        ),

                        ChatItem(
                          name: "Brandon",
                          message: "Goes matching now? 😉",
                          time: "20 m",
                          image: "assets/images/stream3.jpg",
                          online: true,
                        ),

                        ChatItem(
                          name: "Lucy",
                          message: "How’s your day? 😊",
                          time: "1h",
                          image: "assets/images/stream4.jpg",
                        ),

                        ChatItem(
                          name: "Rosa",
                          message: "You took bosa that fire 🔥",
                          time: "1h",
                          image: "assets/images/stream1.jpg",
                        ),

                        ChatItem(
                          name: "Jenny",
                          message: "Wanna video chat? ❤️",
                          time: "5 mins ago",
                          image: "assets/images/stream1.jpg",
                          unread: true,
                        ),

                        ChatItem(
                          name: "Lisa",
                          message: "Now Finn told you fixed the pic!",
                          time: "15 m",
                          image: "assets/images/stream2.jpg",
                        ),

                        ChatItem(
                          name: "Brandon",
                          message: "Goes matching now? 😉",
                          time: "20 m",
                          image: "assets/images/stream3.jpg",
                          online: true,
                        ),

                        ChatItem(
                          name: "Lucy",
                          message: "How’s your day? 😊",
                          time: "1h",
                          image: "assets/images/stream4.jpg",
                        ),

                        ChatItem(
                          name: "Rosa",
                          message: "You took bosa that fire 🔥",
                          time: "1h",
                          image: "assets/images/stream1.jpg",
                        ),

                      ],
                    ),
                  )

                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}

class ChatItem extends StatelessWidget {

  final String name;
  final String message;
  final String time;
  final String image;
  final bool unread;
  final bool online;

  const ChatItem({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.image,
    this.unread = false,
    this.online = false,
  });

  @override
  Widget build(BuildContext context) {
  
return InkWell(
  borderRadius: BorderRadius.circular(15),
  onTap: () {
    // Navigate to chat screen
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PrivateChatScreen(),
        ),
      );
  },
  child: Card(
    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    color: Colors.white.withOpacity(0.05), // glass effect
    shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(15),
  side: BorderSide(
    color: Colors.white.withOpacity(0.05),
  ),
),
    
    elevation: 0, // keep it flat (modern UI)

    child: Padding(
      padding: const EdgeInsets.all(12),

      child: Row(
        children: [

          /// PROFILE IMAGE
          Stack(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(image),
              ),

              if (online)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
            ],
          ),

          const SizedBox(width: 12),

          /// TEXT CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  message,
                  style: const TextStyle(color: Colors.white70),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          /// TIME + STATUS
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Text(
                time,
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 6),

              if (unread)
                Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                )
            ],
          )
        ],
      ),
    ),
  ),
);
  
}
}
