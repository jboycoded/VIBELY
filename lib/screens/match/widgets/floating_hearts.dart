import 'package:flutter/material.dart';
import 'dart:math';

class FloatingHearts extends StatefulWidget {
  const FloatingHearts({super.key});

  @override
  FloatingHeartsState createState() => FloatingHeartsState();
}

class FloatingHeartsState extends State<FloatingHearts>
    with TickerProviderStateMixin {
  final List<Widget> hearts = [];
  final Random random = Random();

  void addHeart() {
    final controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    final animation = Tween<double>(begin: 0, end: 1).animate(controller);

    final heart = AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Positioned(
          bottom: 80 + animation.value * 200,
          left: random.nextDouble() * 200,
          child: Opacity(
            opacity: 1 - animation.value,
            child: const Icon(Icons.favorite, color: Colors.pink, size: 30),
          ),
        );
      },
    );

    setState(() => hearts.add(heart));

    controller.forward().then((_) {
      controller.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: hearts);
  }
}
