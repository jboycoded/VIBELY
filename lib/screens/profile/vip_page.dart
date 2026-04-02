import 'package:flutter/material.dart';
import '../vibely_background.dart';

class VipPage extends StatelessWidget {
  const VipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VibelyBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // 🔙 HEADER
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back,
                          color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      "VIBELY VIP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // 👑 CURRENT STATUS
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [Colors.purple, Colors.pinkAccent],
                    ),
                  ),
                  child: Column(
                    children: const [
                      Icon(Icons.workspace_premium,
                          color: Colors.white, size: 40),
                      SizedBox(height: 10),
                      Text(
                        "You are not a VIP yet",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // ✨ BENEFITS
                Expanded(
                  child: ListView(
                    children: [
                      benefitTile("No Ads"),
                      benefitTile("Exclusive Streams"),
                      benefitTile("VIP Badge"),
                      benefitTile("Priority Matching"),

                      const SizedBox(height: 20),

                      // 💰 PLANS
                      planCard(
                        title: "Weekly",
                        price: "₦1,500",
                      ),

                      planCard(
                        title: "Monthly",
                        price: "₦4,500",
                        highlight: true,
                      ),

                      planCard(
                        title: "Yearly",
                        price: "₦45,000",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 🔹 BENEFIT TILE
  Widget benefitTile(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle,
              color: Colors.pinkAccent, size: 18),
          const SizedBox(width: 10),
          Text(text,
              style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  // 🔹 PLAN CARD
  Widget planCard({
    required String title,
    required String price,
    bool highlight = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: highlight
            ? Colors.purple.withOpacity(0.4)
            : Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(18),
        border: highlight
            ? Border.all(color: Colors.pinkAccent)
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              Text(price,
                  style: const TextStyle(
                      color: Colors.white70)),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 8),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pinkAccent, Colors.purple],
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: const Text(
              "Subscribe",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
