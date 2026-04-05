import 'package:flutter/material.dart';
import '../vibely_background.dart';

class EventCenterPage extends StatefulWidget {
  const EventCenterPage({super.key});

  @override
  State<EventCenterPage> createState() => _EventCenterPageState();
}

class _EventCenterPageState extends State<EventCenterPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  Duration timeLeft = const Duration(hours: 5, minutes: 30);

  List<Map<String, dynamic>> leaderboard = [
    {"name": "Alice", "points": 1200},
    {"name": "John", "points": 950},
    {"name": "Sophia", "points": 870},
    {"name": "Daniel", "points": 700},
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  String formatTime(Duration d) {
    return "${d.inHours}h ${d.inMinutes % 60}m";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VibelyBackground(
        child: SafeArea(
          child: Column(
            children: [

              /// 🔙 HEADER
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const Text("Event Center",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),

              /// 🔘 TABS
              TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: "Live"),
                  Tab(text: "Upcoming"),
                  Tab(text: "Ended"),
                ],
              ),

              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    buildLive(),
                    buildUpcoming(),
                    buildEnded(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLive() {
    return Column(
      children: [

        const SizedBox(height: 10),

        /// ⏱ COUNTDOWN
        Text("Ends in: ${formatTime(timeLeft)}",
            style: const TextStyle(color: Colors.white70)),

        const SizedBox(height: 10),

        /// 🏆 LEADERBOARD
        Expanded(
          child: ListView.builder(
            itemCount: leaderboard.length,
            itemBuilder: (_, i) {
              final user = leaderboard[i];

              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.07),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Text("#${i + 1}",
                        style: const TextStyle(color: Colors.white)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(user["name"],
                          style: const TextStyle(color: Colors.white)),
                    ),
                    Text("${user["points"]}",
                        style:
                            const TextStyle(color: Colors.pinkAccent)),
                  ],
                ),
              );
            },
          ),
        ),

        /// 🔥 JOIN BUTTON
        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("Join Event"),
          ),
        )
      ],
    );
  }

  Widget buildUpcoming() {
    return const Center(
      child: Text("Upcoming Events",
          style: TextStyle(color: Colors.white)),
    );
  }

  Widget buildEnded() {
    return const Center(
      child:
          Text("Past Events", style: TextStyle(color: Colors.white)),
    );
  }
}
