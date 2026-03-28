import 'package:flutter/material.dart';
import '../screens/chats/private_chat_screen.dart';

class ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String image;
  final bool unread;
  final bool online;
  final VoidCallback onTap;

  const ChatItem({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.image,
    required this.onTap,
    this.unread = false,
    this.online = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        color: Colors.white.withOpacity(0.05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),

        child: Padding(
          padding: const EdgeInsets.all(12),

          child: Row(
            children: [

              /// HERO AVATAR (for animation)
              Hero(
                tag: image,
                child: Stack(
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
              ),

              const SizedBox(width: 12),

              /// TEXT
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

              /// TIME + UNREAD
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
