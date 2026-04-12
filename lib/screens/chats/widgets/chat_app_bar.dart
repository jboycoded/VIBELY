import 'package:flutter/material.dart';

// Replace 'your_app_name' with your actual project name
import '../../../models/user_model.dart';


class ChatAppBar extends StatelessWidget {
  final UserModel user;

  const ChatAppBar({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [

          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),

          Hero(
            tag: user.imageUrl + "_" + user.id,
            child: CircleAvatar(
              backgroundImage: AssetImage(user.imageUrl),
            ),
          ),

          const SizedBox(width: 10),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.name,
                  style: const TextStyle(color: Colors.white)),

              Text(
                user.isOnline ? "Online" : "Offline",
                style: TextStyle(
                  color: user.isOnline ? Colors.green : Colors.white54,
                  fontSize: 12,
                ),
              ),
            ],
          ),

          const Spacer(),

          const Icon(Icons.call, color: Colors.white70),
          const SizedBox(width: 10),
          const Icon(Icons.videocam, color: Colors.white70),
        ],
      ),
    );
  }
}
