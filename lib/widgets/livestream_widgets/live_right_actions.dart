import 'package:flutter/material.dart';

class LiveRightActions extends StatelessWidget {
  final int likes;
  final VoidCallback onLike;
  final VoidCallback onGiftTap;
  final VoidCallback onShare;

  const LiveRightActions({
    super.key,
    required this.likes,
    required this.onLike,
    required this.onGiftTap,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _likeAction(),
        const SizedBox(height: 16),
        _icon(Icons.card_giftcard, onGiftTap),
        const SizedBox(height: 16),
        _icon(Icons.share, onShare),
      ],
    );
  }

  /// ❤️ LIKE BUTTON
  Widget _likeAction() {
    return Column(
      children: [
        GestureDetector(
          onTap: onLike,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.favorite, color: Colors.pink),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          _formatLikes(likes),
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }

  /// 🔘 GENERIC ICON BUTTON
  Widget _icon(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  /// 🔢 FORMAT (1200 → 1.2K)
  String _formatLikes(int likes) {
    if (likes >= 1000) {
      return "${(likes / 1000).toStringAsFixed(1)}K";
    }
    return likes.toString();
  }
}
