import 'package:flutter/material.dart';
import '../../models/user_model.dart';

class ProfileHeader extends StatelessWidget {
  final UserModel user;

  const ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),

        /// PROFILE IMAGE
        Container(
          padding: const EdgeInsets.all(3),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xFF7B3BFF), Color(0xFFFF4D8D)],
            ),
          ),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(user.imageUrl),
          ),
        ),

        const SizedBox(height: 12),

        /// NAME + TAG
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              user.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(width: 8),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.pinkAccent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.female, size: 12, color: Colors.pinkAccent),
                  const SizedBox(width: 3),
                  Text(
                    "${user.age}",
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 6),

        Text(user.country, style: const TextStyle(color: Colors.white70)),
        const SizedBox(height: 5),
        Text(user.id, style: const TextStyle(color: Colors.white70)),

        const SizedBox(height: 10),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            user.bio,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white60),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
