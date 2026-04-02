import 'package:flutter/material.dart';
import '../vibely_background.dart';

class EventCenterPage extends StatelessWidget {
  const EventCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final leaderboard = [
      {"name": "Alice", "points": 1200},
      {"name": "John", "points": 950},
      {"name": "Sophia", "points": 870},
    ];

    return Scaffold(
      body: VibelyBackground(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              const SizedBox(height: 40),

              const Text("🔥 Weekly Event",
                  style: TextStyle(
                      color: Colors.white, fontSize: 22)),

              const SizedBox(height: 10),

              const Text("Ends in: 2d 5h",
                  style: TextStyle(color: Colors.white54)),

              const SizedBox(height: 20),

              /// 🏆 LEADERBOARD
              Expanded(
                child: ListView.builder(
                  itemCount: leaderboard.length,
                  itemBuilder: (_, i) {
                    final user = leaderboard[i];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Text("#${i + 1}",
                              style: const TextStyle(
                                  color: Colors.white)),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(user["name"] as String,
                                style: const TextStyle(
                                    color: Colors.white)),
                          ),
                          Text("${user["points"]} pts",
                              style: const TextStyle(
                                  color: Colors.pinkAccent)),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
