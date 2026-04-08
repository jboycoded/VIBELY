import 'package:flutter/material.dart';
import '../../models/gift.dart';

class GiftQuickBar extends StatelessWidget {
  final Function(GiftModel) onGiftTap;

  const GiftQuickBar({
    super.key,
    required this.onGiftTap,
  });

  @override
  Widget build(BuildContext context) {
    final List<GiftModel> gifts = [
      GiftModel(name: "Gift Box", coins: 10, asset: "🎁"),
      GiftModel(name: "Heart", coins: 5, asset: "💜"),
      GiftModel(name: "Fire", coins: 20, asset: "🔥"),
      GiftModel(name: "Rose", coins: 15, asset: "🌹"),
      GiftModel(name: "Crown", coins: 50, asset: "👑"),
      GiftModel(name: "Diamond", coins: 100, asset: "💎"),
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
              onTap: () => onGiftTap(gift),

              /// 🔥 Visual feedback (tap feel)
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    gift.asset,
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${gift.coins}",
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
