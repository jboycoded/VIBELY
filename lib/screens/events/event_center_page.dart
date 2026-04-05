import 'package:flutter/material.dart';
import '../vibely_background.dart';
import '../../widgets/vibely_design.dart';

class EventCenterPage extends StatefulWidget {
  const EventCenterPage({super.key});

  @override
  State<EventCenterPage> createState() => _EventCenterPageState();
}

class _EventCenterPageState extends State<EventCenterPage>
    with SingleTickerProviderStateMixin {
  late TabController tab;

  @override
  void initState() {
    tab = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: VibelyBackground(
        child: SafeArea(
          child: Column(
            children: [

              vibelyHeader(context, "Event Center"),

              TabBar(
                controller: tab,
                tabs: const [
                  Tab(text: "Live"),
                  Tab(text: "Upcoming"),
                  Tab(text: "Ended"),
                ],
              ),

              Expanded(
                child: TabBarView(
                  controller: tab,
                  children: [
                    leaderboard(),
                    empty("No upcoming events"),
                    empty("No past events"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget leaderboard() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (_, i) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(14),
          decoration: vibelyGlassBox(),
          child: Row(
            children: [
              Text("#${i + 1}",
                  style: const TextStyle(color: Colors.white)),
              const SizedBox(width: 10),
              const Expanded(
                child: Text("User",
                    style: TextStyle(color: Colors.white)),
              ),
              const Text("1200",
                  style: TextStyle(color: Colors.pinkAccent)),
            ],
          ),
        );
      },
    );
  }

  Widget empty(String text) {
    return Center(
      child: Text(text,
          style: const TextStyle(color: Colors.white54)),
    );
  }
}
