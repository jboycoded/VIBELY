import 'package:flutter/material.dart';
import '../../models/user_model.dart';

class ProfileHeader extends StatelessWidget {
  final UserModel user;

  const ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
  children: [
    /// PROFILE IMAGE
    Stack(
      alignment: Alignment.bottomRight,
      children: [
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
            backgroundImage: user.imageFile != null
                ? FileImage(user.imageFile!)
                : AssetImage(user.imageUrl) as ImageProvider,
          ),
        ),

        /// ❤️ LIKE BUTTON
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.pink,
          ),
          child: const Icon(Icons.favorite, color: Colors.white, size: 18),
        ),
      ],
    ),

    const SizedBox(height: 16),

    /// NAME + TAG
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              user.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.pinkAccent.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(
                    user.gender == "male"
                    ? Icons.male
                    : Icons.female, 
                    size: 12, color: Colors.pinkAccent),
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

    const SizedBox(height: 8),

    /// 🌍 AGE + COUNTRY
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.cake, size: 14, color: Colors.white70),
        const SizedBox(width: 4),
        Text(
          '${user.age}',
          style: const TextStyle(color: Colors.white70),
        ),
        const SizedBox(width: 12),
        const Icon(Icons.location_on, size: 14, color: Colors.white70),
        const SizedBox(width: 4),
        Text(
          user.country,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    ),

    const SizedBox(height: 4),

    /// 🆔 USER ID
    Text(
      'ID: ${user.id}',
      style: const TextStyle(color: Colors.white54, fontSize: 12),
    ),

    const SizedBox(height: 12),

    /// 🧾 BIO
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Text(
        user.bio,
        textAlign: TextAlign.center,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Colors.white60, height: 1.4),
      ),
    ),
    const SizedBox(height: 20),
  ],
);
  }
}
      
