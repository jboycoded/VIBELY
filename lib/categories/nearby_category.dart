import 'package:flutter/material.dart';
import '../screens/streaming/live_screen.dart';

class NearbyCategory extends StatelessWidget {
  const NearbyCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: 10,
      itemBuilder: (_, index) => _NearbyTile(),
    );
  }
}

class _NearbyTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.05),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage:
              AssetImage("assets/images/streamer1.jpg"),
        ),
        title: const Text("Streamer Nearby",
            style: TextStyle(color: Colors.white)),
        subtitle: const Text("2km away",
            style: TextStyle(color: Colors.white70)),
        trailing: const Icon(Icons.play_arrow, color: Colors.white),
        onTap: () async {
  // Wait 150ms so the user actually sees the touch feedback
  await Future.delayed(const Duration(milliseconds: 150));
  
  if (context.mounted) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const LiveScreen()),
    );
  }
},
        ),
      ),
  }
}
