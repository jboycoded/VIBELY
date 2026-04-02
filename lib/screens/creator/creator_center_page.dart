import 'package:flutter/material.dart';
import '../vibely_background.dart';

class CreatorCenterPage extends StatelessWidget {
  const CreatorCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VibelyBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                /// 🔝 HEADER
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const Text(
                      "Creator Center",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// 📊 STATS
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    StatBox(title: "Views", value: "12.5K"),
                    StatBox(title: "Followers", value: "1.2K"),
                    StatBox(title: "Earnings", value: "₦25K"),
                  ],
                ),

                const SizedBox(height: 20),

                /// 🔴 GO LIVE BUTTON
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFF4D8D), Color(0xFF7B3BFF)],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text("Go Live",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                ),

                const SizedBox(height: 20),

                /// 📈 ANALYTICS LIST
                Expanded(
                  child: ListView(
                    children: const [
                      CreatorTile("Total Streams", "85"),
                      CreatorTile("Total Gifts", "320"),
                      CreatorTile("Peak Viewers", "450"),
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
}

class StatBox extends StatelessWidget {
  final String title;
  final String value;

  const StatBox({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(value, style: const TextStyle(color: Colors.white)),
          Text(title, style: const TextStyle(color: Colors.white54)),
        ],
      ),
    );
  }
}

class CreatorTile extends StatelessWidget {
  final String title;
  final String value;

  const CreatorTile(this.title, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing: Text(value, style: const TextStyle(color: Colors.white)),
    );
  }
			}
