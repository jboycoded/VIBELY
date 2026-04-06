import 'package:flutter/material.dart';
import '../screens/streaming/live_screen.dart';

class FollowingCategory extends StatelessWidget {
  const FollowingCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: 10,
      itemBuilder: (_, index) => _FollowTile(),
    );
  }
}

class _FollowTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.05),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Stack(
          children: [
            const CircleAvatar(
              backgroundImage:
                  AssetImage("assets/images/streamer1.jpg"),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 10,
                width: 10,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            )
          ],
        ),
        title: const Text("Following User",
            style: TextStyle(color: Colors.white)),
        trailing: ElevatedButton(
          onPressed: () {
            // TODO: navigate to live screen
        Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const LiveScreen(),
    ),
  );
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF9C27B0)),
          child: const Text(
            "Join",
          style: TextStyle(color: Colors.white)
          ),
        ),
      ),
    );
  }
}
