import 'package:flutter/material.dart';

class GiftQuickBar extends StatelessWidget {
  const GiftQuickBar({super.key});

  @override
  Widget build(BuildContext context) {
    final gifts = [
      "🎁",
      "💜",
      "🔥",
      "🌹",
      "👑",
      "💎",
    ];

    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: gifts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                /// trigger gift animation later
              },
              child: Container(
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    gifts[index],
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
