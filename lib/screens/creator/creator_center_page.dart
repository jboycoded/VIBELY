import 'package:flutter/material.dart';
import '../vibely_background.dart';

class CreatorCenterPage extends StatefulWidget {
  const CreatorCenterPage({super.key});

  @override
  State<CreatorCenterPage> createState() => _CreatorCenterPageState();
}

class _CreatorCenterPageState extends State<CreatorCenterPage> {
  int selectedFilter = 0;

  final filters = ["Today", "Week", "Month"];

  Map<String, Map<String, int>> data = {
    "Today": {"earnings": 5400, "streams": 3, "followers": 20},
    "Week": {"earnings": 25400, "streams": 12, "followers": 120},
    "Month": {"earnings": 102000, "streams": 40, "followers": 540},
  };

  @override
  Widget build(BuildContext context) {
    final current = data[filters[selectedFilter]]!;

    return Scaffold(
      body: VibelyBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [

                  /// 🔙 HEADER
                  Row(
                    children: [
                      IconButton(
                        onPressed: () =>
                            Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back,
                            color: Colors.white),
                      ),
                      const Text("Creator Center",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20)),
                    ],
                  ),

                  const SizedBox(height: 10),

                  /// 🔘 FILTERS
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                    children: List.generate(filters.length, (i) {
                      bool active = i == selectedFilter;

                      return GestureDetector(
                        onTap: () =>
                            setState(() => selectedFilter = i),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: active
                                ? Colors.pinkAccent
                                    .withOpacity(0.2)
                                : Colors.white.withOpacity(0.05),
                            borderRadius:
                                BorderRadius.circular(12),
                          ),
                          child: Text(filters[i],
                              style: TextStyle(
                                  color: active
                                      ? Colors.pinkAccent
                                      : Colors.white70)),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 20),

                  /// 💰 EARNINGS CARD
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF7B3BFF),
                          Color(0xFFFF4D8D)
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        const Text("Total Earnings",
                            style:
                                TextStyle(color: Colors.white70)),
                        const SizedBox(height: 10),
                        Text("₦${current["earnings"]}",
                            style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// 📊 STATS
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      statBox("Streams", current["streams"]),
                      statBox("Followers", current["followers"]),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// 🎬 ACTION BUTTONS
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Go Live"),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Withdraw"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget statBox(String title, int? value) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Text("$value",
                style:
                    const TextStyle(color: Colors.white)),
            const SizedBox(height: 5),
            Text(title,
                style: const TextStyle(
                    color: Colors.white54, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
