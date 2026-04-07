import 'package:flutter/material.dart';

class GiftOverlay {
  static void show(BuildContext context) {
    final overlay = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 120,
        left: MediaQuery.of(context).size.width / 2 - 25,
        child: const Icon(
          Icons.card_giftcard,
          color: Colors.pink,
          size: 50,
        ),
      ),
    );

    Overlay.of(context).insert(overlay);

    Future.delayed(const Duration(seconds: 1), () {
      overlay.remove();
    });
  }
}
