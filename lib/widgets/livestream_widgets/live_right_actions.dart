import 'package:flutter/material.dart';

class LiveRightActions extends StatelessWidget {
  const LiveRightActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _action(Icons.favorite, Colors.pink),
        const SizedBox(height: 16),
        _action(Icons.card_giftcard, Colors.purple),
        const SizedBox(height: 16),
        _action(Icons.share, Colors.white),
      ],
    );
  }

  Widget _action(IconData icon, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 5),
        const Text("1.2K",
            style: TextStyle(color: Colors.white, fontSize: 12))
      ],
    );
  }
}
