import 'package:flutter/material.dart';
import '../vibely_background.dart';

class CreatorCenterPage extends StatefulWidget {
  const CreatorCenterPage({super.key});

  @override
  State<CreatorCenterPage> createState() =>
      _CreatorCenterPageState();
}

class _CreatorCenterPageState
    extends State<CreatorCenterPage> {
  int selected = 0;
  final filters = ["Today", "Week", "Month"];

  final data = {
    "Today": {"earnings": 5400, "streams": 3},
    "Week": {"earnings": 25400, "streams": 12},
    "Month": {"earnings": 102000, "streams": 40},
  };

  @override
  Widget build(BuildContext context) {
    final current = data[filters[selected]]!;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: VibelyBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [

                /// 🔙 HEADER
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
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
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                /// 🔘 FILTERS
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                  children: List.generate(filters.length, (i) {
                    bool active = i == selected;

                    return GestureDetector(
                      onTap: () =>
                          setState(() => selected = i),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: active
                              ? Colors.pinkAccent
                                  .withOpacity(0.2)
                              : Colors.white.withOpacity(0.06),
                          borderRadius:
                              BorderRadius.circular(14),
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
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16),
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
                      const Text("Earnings",
                          style: TextStyle(
                              color: Colors.white70)),
                      const SizedBox(height: 8),
                      Text("₦${current["earnings"]}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight:
                                  FontWeight.bold)),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// 📊 STATS
                Row(
                  children: [
                    statCard(
                        "Streams", "${current["streams"]}"),
                    statCard("Fans", "120"),
                  ],
                ),

                const SizedBox(height: 20),

                /// 🎬 ACTIONS
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      expandedButton("Go Live"),
                      const SizedBox(width: 10),
                      expandedButton("Withdraw"),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget statCard(String title, String value) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(value,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(title,
                style: const TextStyle(
                    color: Colors.white54, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget expandedButton(String text) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFFFF4D8D),
              Color(0xFF7B3BFF)
            ],
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Center(
                child: Text(text,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
