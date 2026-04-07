import 'package:flutter/material.dart';
import 'dart:math';

class FloatingHearts extends StatefulWidget {
  const FloatingHearts({super.key});

  @override
  FloatingHeartsState createState() => FloatingHeartsState();
}

class FloatingHeartsState extends State<FloatingHearts>
    with TickerProviderStateMixin {
  final List<_HeartItem> hearts = [];
  final Random random = Random();

  void addHeart() {
    final controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    final animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    );

    final heart = _HeartItem(
      controller: controller,
      animation: animation,
      startX: random.nextDouble() * 250,
      curveOffset: random.nextDouble() * 40,
    );

    setState(() => hearts.add(heart));

    controller.forward().then((_) {
      controller.dispose();
      setState(() => hearts.remove(heart));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: hearts.map((h) {
        return AnimatedBuilder(
          animation: h.animation,
          builder: (_, __) {
            final t = h.animation.value;

            return Positioned(
              bottom: 80 + t * 220,
              left: h.startX + sin(t * pi * 2) * h.curveOffset,
              child: Opacity(
                opacity: 1 - t,
                child: Transform.scale(
                  scale: 0.8 + (t * 0.5),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.pink,
                    size: 30,
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class _HeartItem {
  final AnimationController controller;
  final Animation<double> animation;
  final double startX;
  final double curveOffset;

  _HeartItem({
    required this.controller,
    required this.animation,
    required this.startX,
    required this.curveOffset,
  });
}
