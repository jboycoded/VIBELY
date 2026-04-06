import 'package:flutter/material.dart';

class LiveRightActions extends StatelessWidget {
  const LiveRightActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _likeAction(),
        const SizedBox(height: 16),
        _icon(Icons.card_giftcard),
        const SizedBox(height: 16),
        _icon(Icons.share),
      ],
    );
  }

  Widget _likeAction() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.favorite, color: Colors.pink),
        ),
        const SizedBox(height: 5),
        const Text("1.2K",
            style: TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }

  Widget _icon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}
