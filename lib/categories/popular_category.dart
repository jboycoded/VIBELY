import 'package:flutter/material.dart';
import '../screens/streaming/live_screen.dart';

class PopularCategory extends StatelessWidget {
  const PopularCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: 12,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.72,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (_, index) => _LiveCard(index: index),
    );
  }
}

class _LiveCard extends StatelessWidget {
  final int index;
  const _LiveCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: navigate to live screen
        Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const LiveScreen(),
    ),
  );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/streamer1.jpg",
                fit: BoxFit.cover,
              ),
            ),

            Container(color: Colors.black.withOpacity(0.3)),

            /// LIVE BADGE
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text("LIVE",
                    style: TextStyle(color: Colors.white)),
              ),
            ),

            /// VIEWERS
            Positioned(
              top: 10,
              right: 10,
              child: Row(
                children: const [
                  Icon(Icons.remove_red_eye,
                      color: Colors.white, size: 16),
                  SizedBox(width: 5),
                  Text("1.5K",
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),

            /// HOST NAME
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                    "Legend",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                  ),
              ),
          ],
        ),
      ),
    );
  }
}
