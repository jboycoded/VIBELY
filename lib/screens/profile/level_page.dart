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
  int nextXp = 500;

  double get progress => xp / nextXp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VibelyBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                /// 🔙 HEADER
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const Text("Levels",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ],
                ),

                const SizedBox(height: 20),

                /// 🏆 CURRENT LEVEL
                Text("Level $level",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),

                const SizedBox(height: 15),

                /// 📊 PROGRESS
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 12,
                    backgroundColor: Colors.white12,
                  ),
                ),

                const SizedBox(height: 10),

                Text("$xp / $nextXp XP",
                    style: const TextStyle(color: Colors.white70)),

                const SizedBox(height: 25),

                /// 🎁 NEXT REWARDS
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RewardIcon("💰"),
                      RewardIcon("🎁"),
                      RewardIcon("👑"),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// 📜 LEVEL LIST
                Expanded(
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (_, i) {
                      int lvl = i + 1;
                      bool unlocked = lvl <= level;

                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.07),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Text("Lv $lvl",
                                style: const TextStyle(color: Colors.white)),

                            const Spacer(),

                            unlocked
                                ? const Icon(Icons.check,
                                    color: Colors.green)
                                : const Icon(Icons.lock,
                                    color: Colors.white38),
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
      ),
    );
  }
}

class RewardIcon extends StatelessWidget {
  final String emoji;
  const RewardIcon(this.emoji, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(emoji, style: const TextStyle(fontSize: 24));
  }
}
