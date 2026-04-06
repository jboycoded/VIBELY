import 'package:flutter/material.dart';

class GiftQuickBar extends StatelessWidget {
  const GiftQuickBar({super.key});

  @override
  Widget build(BuildContext context) {
    final gifts = [
      {"icon": "🎁", "price": 10},
      {"icon": "💜", "price": 5},
      {"icon": "🔥", "price": 20},
      {"icon": "🌹", "price": 15},
      {"icon": "👑", "price": 50},
      {"icon": "💎", "price": 100},
      {"icon": "🎁", "price": 10},
      {"icon": "💜", "price": 5},
      {"icon": "🔥", "price": 20},
      {"icon": "🌹", "price": 15},
      {"icon": "👑", "price": 50},
      {"icon": "💎", "price": 100},
    ];

    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: gifts.length,
        itemBuilder: (context, index) {
          final gift = gifts[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// 🎁 ICON (no background)
                  Text(
                    gift["icon"].toString(),
                    style: const TextStyle(fontSize: 24),
                  ),

                  const SizedBox(height: 4),

                  /// 💰 PRICE
                  Text(
                    "${gift["price"]}",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
