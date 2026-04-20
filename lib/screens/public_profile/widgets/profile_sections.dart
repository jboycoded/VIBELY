import 'package:flutter/material.dart';
import '../../../models/user_model.dart';
import '../../../models/badge_model.dart';

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
  content: [
    user.age?.toString() ?? "Age unknown",
    user.gender ?? "Gender unknown",
    user.country ?? "Location unknown"
  ].join(" • "), // This handles the dots more cleanly
),


        _buildBadgesCard()
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

  Widget _buildBadgesCard() {
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Badges",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: () {}, // Replace with your navigation logic
              child: const Text(
                "View all >",
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16), // Increased spacing for a cleaner look
        user.badges.isEmpty
            ? const Text(
                "No badges yet",
                style: TextStyle(color: Colors.white54),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(), // Smoother scrolling
                child: Row(
                  children: user.badges.map((badge) {
                    return _buildBadgeItem(badge);
                  }).toList(),
                ),
              ),
      ],
    ),
  );
}

  Widget _buildBadgeItem(BadgeModel badge) {
  return Padding(
    padding: const EdgeInsets.only(right: 12.0),
    child: const Column(
      children: [
        // Badge Icon/Graphic
        badge.imageUrl.startsWith('http')
    ? Image.network(
        badge.imageUrl,
        height: 45,
        width: 45,
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.verified, color: Colors.amber, size: 45),
      )
    : Image.asset(
        badge.imageUrl,
        height: 45,
        width: 45,
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.badge, color: Colors.white24, size: 45),
      ),


        const SizedBox(height: 4),
        // Badge Label (Pill shape like the screenshot)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            badge.label,
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
      ],
    ),
  );
  }
  

  
}
