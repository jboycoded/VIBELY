import 'package:flutter/material.dart';

class CoinsPage extends StatelessWidget {
  const CoinsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(title: const Text("Coins")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Balance Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.pinkAccent, Colors.orangeAccent],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                children: [
                  Text("Your Balance", style: TextStyle(color: Colors.white70)),
                  SizedBox(height: 8),
                  Text("12,500",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Packages
            Expanded(
              child: ListView(
                children: [
                  coinTile("500 Coins", "\$2.99"),
                  coinTile("1,500 Coins", "\$6.99"),
                  coinTile("5,000 Coins", "\$14.99", best: true),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget coinTile(String title, String price, {bool best = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white)),
          Row(
            children: [
              if (best)
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text("Best",
                      style: TextStyle(color: Colors.pinkAccent)),
                ),
              Text(price, style: const TextStyle(color: Colors.white)),
            ],
          )
        ],
      ),
    );
  }
}
