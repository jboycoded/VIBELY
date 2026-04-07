import 'package:flutter/material.dart';
import 'dart:math';

class GiftOverlay {
  static void show(BuildContext context) {
    final overlay = Overlay.of(context);

    final entry = OverlayEntry(
      builder: (_) => const _GiftLayer(),
    );

    overlay.insert(entry);

    Future.delayed(const Duration(seconds: 3), () {
      entry.remove();
    });
  }
}

class _GiftLayer extends StatefulWidget {
  const _GiftLayer();

  @override
  State<_GiftLayer> createState() => _GiftLayerState();
}

class _GiftLayerState extends State<_GiftLayer>
    with TickerProviderStateMixin {
  final List<_GiftItem> gifts = [];
  final Random random = Random();

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 6; i++) {
      _spawnGift();
    }
  }

  void _spawnGift() {
    final controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500 + random.nextInt(800)),
    );

    final animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    );

    final gift = _GiftItem(
      controller: controller,
      animation: animation,
      startX: random.nextDouble() * 300,
      drift: random.nextDouble() * 50,
    );

    gifts.add(gift);

    controller.forward().then((_) {
      controller.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        child: Stack(
          children: gifts.map((g) {
            return AnimatedBuilder(
              animation: g.animation,
              builder: (_, __) {
                final t = g.animation.value;

                return Positioned(
                  bottom: 60 + t * 250,
                  left: g.startX + sin(t * pi) * g.drift,
                  child: Opacity(
                    opacity: 1 - t,
                    child: Transform.scale(
                      scale: 0.6 + t,
                      child: const Icon(
                        Icons.card_giftcard,
                        color: Colors.pinkAccent,
                        size: 40,
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _GiftItem {
  final AnimationController controller;
  final Animation<double> animation;
  final double startX;
  final double drift;

  _GiftItem({
    required this.controller,
    required this.animation,
    required this.startX,
    required this.drift,
  });
}
