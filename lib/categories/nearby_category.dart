import 'package:flutter/material.dart';
import '../screens/streaming/live_screen.dart';

class NearbyCategory extends StatelessWidget {
  const NearbyCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final streams = [
      {"name": "Eve", "viewers": "720", "image": "assets/images/stream3.jpg"},
      {"name": "Frank", "viewers": "640", "image": "assets/images/stream4.jpg"},
      {"name": "Grace", "viewers": "500", "image": "assets/images/stream1.jpg"},
      {"name": "Hank", "viewers": "310", "image": "assets/images/stream2.jpg"},
      {"name": "Eve", "viewers": "720", "image": "assets/images/stream3.jpg"},
      {"name": "Frank", "viewers": "640", "image": "assets/images/stream4.jpg"},
      {"name": "Grace", "viewers": "500", "image": "assets/images/stream1.jpg"},
      {"name": "Hank", "viewers": "310", "image": "assets/images/stream2.jpg"},
    ];

    return buildGrid(context, streams);
  }
}

// Use same buildGrid as before
Widget buildGrid(BuildContext context, List<Map<String, String>> streams) {
  return GridView.builder(
    padding: const EdgeInsets.all(12),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.75,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
    ),
    itemCount: streams.length,
    itemBuilder: (context, index) {
      final stream = streams[index];
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LiveScreen()),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(stream["image"]!, fit: BoxFit.cover),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text("LIVE", style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Row(
                  children: [
                    const Icon(Icons.remove_red_eye, color: Colors.white, size: 16),
                    const SizedBox(width: 4),
                    Text(stream["viewers"]!, style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Text(
                  stream["name"]!,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
