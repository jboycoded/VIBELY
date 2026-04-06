import 'package:flutter/material.dart';
import '../screens/streaming/live_screen.dart';

class ExploreCategory extends StatelessWidget {
  const ExploreCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: 12,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (_, index) => _ExploreCard(),
    );
  }
}

class _ExploreCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Text(
          "Discover",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
