import 'package:flutter/material.dart';
import '../vibely_background.dart';

class DailyBonusPage extends StatefulWidget {
  const DailyBonusPage({super.key});

  @override
  State<DailyBonusPage> createState() => _DailyBonusPageState();
}

class _DailyBonusPageState extends State<DailyBonusPage> {
  int streak = 3;
  bool claimedToday = false;

  void claimReward() {
    if (claimedToday) return;

    setState(() {
      claimedToday = true;
      streak++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Reward claimed 🎉")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VibelyBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("🔥 Streak: $streak",
                style: const TextStyle(color: Colors.white)),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: claimReward,
              child: Text(claimedToday ? "Claimed" : "Claim Reward"),
            )
          ],
        ),
      ),
    );
  }
}
