import 'package:flutter/material.dart';
import '../../models/badge_model.dart';

class BadgesSection extends StatelessWidget {
  final List<BadgeModel> badges;

  const BadgesSection({super.key, required this.badges});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔝 HEADER
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
                onTap: () {
                  // TODO: navigate to full badges screen
                },
                child: const Text(
                  "View all >",
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// 🏅 CONTENT
          badges.isEmpty
              ? const Text(
                  "No badges yet",
                  style: TextStyle(color: Colors.white54),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: badges.map((badge) {
                      return _BadgeItem(badge: badge);
                    }).toList(),
                  ),
                ),
        ],
      ),
    );
  }
}

class _BadgeItem extends StatelessWidget {
  final BadgeModel badge;

  const _BadgeItem({required this.badge});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          /// ICON
          badge.imageUrl.startsWith('http')
              ? Image.network(
                  badge.imageUrl,
                  height: 45,
                  width: 45,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.verified,
                          color: Colors.amber, size: 45),
                )
              : Image.asset(
                  badge.imageUrl,
                  height: 45,
                  width: 45,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.badge,
                          color: Colors.white24, size: 45),
                ),

          const SizedBox(height: 4),

          /// LABEL
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              badge.label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
