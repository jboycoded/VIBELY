import 'package:flutter/material.dart';
import '../vibely_background.dart';

class DailyBonusPage extends StatefulWidget {
  const DailyBonusPage({super.key});

  @override
  State<DailyBonusPage> createState() => _DailyBonusPageState();
}

class _DailyBonusPageState extends State<DailyBonusPage> {
  int currentDay = 3;
  bool claimedToday = false;

  final rewards = [50, 100, 150, 200, 300, 500, 1000];

  void claimReward() {
    if (claimedToday) return;

    setState(() {
      claimedToday = true;
    });

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.black,
        title: const Text("Reward Claimed",
            style: TextStyle(color: Colors.white)),
        content: Text(
          "You received ${rewards[currentDay - 1]} coins!",
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                if (currentDay < 7) currentDay++;
              });
            },
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double progress = currentDay / 7;

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
                    icon:
                        const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const Text("Daily Bonus",
                      style:
                          TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),

              const SizedBox(height: 10),

              /// 📊 PROGRESS
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.white12,
                ),
              ),

              const SizedBox(height: 20),

              /// 📅 GRID
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: rewards.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                  itemBuilder: (_, i) {
                    bool unlocked = i < currentDay;
                    bool today = i == currentDay - 1;

                    return Container(
                      margin: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: unlocked
                            ? Colors.pinkAccent.withOpacity(0.2)
                            : Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(14),
                        border: today
                            ? Border.all(color: Colors.pinkAccent)
                            : null,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Day ${i + 1}",
                              style: const TextStyle(
                                  color: Colors.white54)),
                          const SizedBox(height: 5),
                          Text("${rewards[i]}",
                              style:
                                  const TextStyle(color: Colors.white)),
                        ],
                      ),
                    );
                  },
                ),
              ),

              /// 🎁 CLAIM BUTTON
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: claimedToday ? null : claimReward,
                  child: Text(
                      claimedToday ? "Claimed" : "Claim Reward"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
