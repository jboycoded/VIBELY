import 'package:flutter/material.dart';
import '../private_chat_screen.dart';

import '../../../models/conversation_model.dart'; 
import '../../../models/user_model.dart';
import '../../../models/message_model.dart';


class ChatItem extends StatelessWidget {
  final ConversationModel conversation;
  final VoidCallback onTap;

  const ChatItem({
    super.key,
    required this.conversation,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final user = conversation.user;
    final message = conversation.lastMessage;

    String heroTag = user.imageUrl + "_" + user.id;

    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        color: Colors.white.withOpacity(0.05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      
        child: InkWell(
    borderRadius: BorderRadius.circular(15), // Match your card shape
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
            children: [

              /// AVATAR
              Hero(
                tag: heroTag,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(user.imageUrl),
                    ),
                    if (user.isOnline)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
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
                      user.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      message.text,
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
                    _formatTime(message.timestamp),
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 6),
                  if (conversation.unreadCount > 0)
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

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);

    if (diff.inMinutes < 1) return "Now";
    if (diff.inMinutes < 60) return "${diff.inMinutes}m";
    if (diff.inHours < 24) return "${diff.inHours}h";
    return "${time.day}/${time.month}";
  }
}
