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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VibelyBackground(
        child: Column(
          children: [

            const SizedBox(height: 50),

            const Text("Daily Bonus",
                style: TextStyle(color: Colors.white, fontSize: 22)),

            const SizedBox(height: 20),

            /// 📅 STREAK GRID
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: rewards.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                itemBuilder: (_, i) {
                  bool isActive = i == currentDay - 1;
                  bool isUnlocked = i < currentDay;

                  return Container(
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: isUnlocked
                          ? Colors.pinkAccent.withOpacity(0.2)
                          : Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(12),
                      border: isActive
                          ? Border.all(color: Colors.pinkAccent)
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        "${rewards[i]}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),

            /// 🎁 CLAIM BUTTON
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: claimedToday
                    ? null
                    : () {
                        setState(() {
                          claimedToday = true;
                          currentDay++;
                        });
                      },
                child: Text(claimedToday ? "Claimed" : "Claim Reward"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
