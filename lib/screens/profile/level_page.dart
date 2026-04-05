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
      backgroundColor: Colors.transparent,
      body: VibelyBackground(
        child: SafeArea(
          child: Column(
            children: [

              /// 🔙 HEADER
              header("Levels"),

              const SizedBox(height: 20),

              /// 🏆 LEVEL
              Text("Level $level",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold)),

              const SizedBox(height: 12),

              /// 📊 PROGRESS
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 10,
                    backgroundColor: Colors.white12,
                    valueColor:
                        const AlwaysStoppedAnimation(Colors.pinkAccent),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Text("$xp / $nextXp XP",
                  style: const TextStyle(color: Colors.white70)),

              const SizedBox(height: 20),

              /// 📜 LEVEL LIST
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: 20,
                  itemBuilder: (_, i) {
                    int lvl = i + 1;
                    bool unlocked = lvl <= level;

                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(14),
                      decoration: glassBox(),
                      child: Row(
                        children: [
                          Text("Level $lvl",
                              style: const TextStyle(color: Colors.white)),
                          const Spacer(),
                          Icon(
                            unlocked ? Icons.check : Icons.lock,
                            color: unlocked
                                ? Colors.green
                                : Colors.white38,
                          )
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
