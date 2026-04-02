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
                    const Text("Creator Center",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ],
                ),

                const SizedBox(height: 10),

                /// 🔘 FILTERS
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(filters.length, (i) {
                    final active = selectedFilter == i;
                    return GestureDetector(
                      onTap: () => setState(() => selectedFilter = i),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: active
                              ? Colors.pinkAccent.withOpacity(0.2)
                              : Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          filters[i],
                          style: TextStyle(
                            color: active
                                ? Colors.pinkAccent
                                : Colors.white70,
                          ),
                        ),
                      ),
                    );
                  }),
                ),

                const SizedBox(height: 20),

                /// 💎 EARNINGS CARD
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF7B3BFF), Color(0xFFFF4D8D)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: const [
                      Text("Total Earnings",
                          style: TextStyle(color: Colors.white70)),
                      SizedBox(height: 10),
                      Text("₦25,400",
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// 📊 STATS GRID
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1.4,
                    children: const [
                      CreatorStat("Streams", "45"),
                      CreatorStat("Gifts", "1.2K"),
                      CreatorStat("Followers Gained", "320"),
                      CreatorStat("Peak Viewers", "500"),
                    ],
                  ),
                ),

                /// 🔴 GO LIVE
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFF4D8D), Color(0xFF7B3BFF)],
                    ),
                  ),
                  child: const Center(
                    child: Text("Go Live",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CreatorStat extends StatelessWidget {
  final String title;
  final String value;

  const CreatorStat(this.title, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value,
              style: const TextStyle(color: Colors.white, fontSize: 18)),
          const SizedBox(height: 5),
          Text(title,
              style: const TextStyle(color: Colors.white54, fontSize: 12)),
        ],
      ),
    );
  }
}
