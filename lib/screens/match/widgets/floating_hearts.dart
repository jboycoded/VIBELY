import 'dart:math';
import 'package:flutter/material.dart';

class FloatingHearts extends StatefulWidget {
  const FloatingHearts({super.key});

  @override
  State<FloatingHearts> createState() => _FloatingHeartsState();
}

class FloatingHeartsState extends State<FloatingHearts> {
  final List<Widget> hearts = [];

  void addHeart() {
    final random = Random();

    final heart = Positioned(
      bottom: 0,
      left: random.nextDouble() * 300,
      child: _HeartWidget(
        key: UniqueKey(),
      ),
    );

    setState(() => hearts.add(heart));

    Future.delayed(const Duration(seconds: 3), () {
      setState(() => hearts.remove(heart));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: hearts);
  }
}

class _HeartWidget extends StatefulWidget {
  const _HeartWidget({super.key});

  @override
  State<_HeartWidget> createState() => _HeartWidgetState();
}

class _HeartWidgetState extends State<_HeartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    animation = Tween<double>(begin: 0, end: -300).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    );

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, child) {
        return Transform.translate(
          offset: Offset(0, animation.value),
          child: Opacity(
            opacity: 1 - controller.value,
            child: const Icon(Icons.favorite,
                color: Colors.pink, size: 30),
          ),
        );
      },
    );
  }
}
