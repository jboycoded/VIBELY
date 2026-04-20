import 'package:flutter/material.dart';
import '../../../models/user_model.dart';

class ProfileSections extends StatelessWidget {
  final UserModel user;

  const ProfileSections({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _card(
          title: "About",
          content: user.bio ?? "No bio yet",
        ),

        _card(
          title: "Basic Information",
          content:
              "${user.age} • ${user.gender} • ${user.country}",
        ),

        _card(
          title: "Badges",
          content: user.badges.isEmpty
              ? "No badges yet"
              : user.badges.join(", "),
        ),
      ],
    );
  }

  Widget _card({
    required String title,
    required String content,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.08),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),

          const SizedBox(height: 8),

          Text(
            content,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
