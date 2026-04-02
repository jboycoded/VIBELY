import 'package:flutter/material.dart';
import '../vibely_background.dart';

class LevelPage extends StatefulWidget {
  const LevelPage({super.key});

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  int level = 5;
  int xp = 320;
  int nextLevelXp = 500;

  double get progress => xp / nextLevelXp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VibelyBackground(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              const SizedBox(height: 40),

              /// 🏆 LEVEL DISPLAY
              Text("Level $level",
                  style: const TextStyle(
                      color: Colors.white, fontSize: 28)),

              const SizedBox(height: 20),

              /// 📊 PROGRESS BAR
              LinearProgressIndicator(
                value: progress,
                minHeight: 10,
              ),

              const SizedBox(height: 10),

              Text("$xp / $nextLevelXp XP",
                  style: const TextStyle(color: Colors.white70)),

              const SizedBox(height: 30),

              /// 🎁 REWARDS
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Next Rewards",
                    style: TextStyle(color: Colors.white)),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: ListView(
                  children: const [
                    RewardTile("100 Coins"),
                    RewardTile("Exclusive Frame"),
                    RewardTile("VIP Trial"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RewardTile extends StatelessWidget {
  final String reward;

  const RewardTile(this.reward, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(reward,
          style: const TextStyle(color: Colors.white)),
    );
  }
}
