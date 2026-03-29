import 'package:flutter/material.dart';

import '../vibely_background.dart';

class CoinsPage extends StatelessWidget {
  const CoinsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: vibelyBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Row(
                  children: [
                    Icon(Icons.arrow_back, color: Colors.white),
                    SizedBox(width: 12),
                    Text("Coins",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ],
                ),

                const SizedBox(height: 20),

                // 💰 Balance Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.pinkAccent, Colors.purple],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    children: [
                      Text("Your Balance",
                          style: TextStyle(color: Colors.white70)),
                      SizedBox(height: 8),
                      Text("2460",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // 🪙 Packages
                Expanded(
                  child: ListView(
                    children: [
                      coinTile("100 Coins", "₦500"),
                      coinTile("500 Coins", "₦2000"),
                      coinTile("1000 Coins", "₦3500", best: true),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget coinTile(String title, String price, {bool best = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(color: Colors.white)),

          Row(
            children: [
              if (best)
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text("Best",
                      style: TextStyle(
                          color: Colors.pinkAccent,
                          fontWeight: FontWeight.bold)),
                ),
              Text(price,
                  style: const TextStyle(color: Colors.white)),
            ],
          )
        ],
      ),
    );
  }
}
