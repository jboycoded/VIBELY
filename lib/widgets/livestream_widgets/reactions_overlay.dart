import 'dart:math';
import 'package:flutter/material.dart';

class ReactionsOverlay extends StatefulWidget {
  const ReactionsOverlay({super.key});

  @override
  State<ReactionsOverlay> createState() => _ReactionsOverlayState();
}

class _ReactionsOverlayState extends State<ReactionsOverlay>
    with TickerProviderStateMixin {
  final List<Widget> hearts = [];

  void _addHeart() {
    final random = Random();

    final controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    final animation = Tween<double>(begin: 0, end: -300).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    );

    final heart = AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Positioned(
          bottom: 20 + animation.value,
          right: 20 + random.nextDouble() * 50,
          child: Opacity(
            opacity: 1 - controller.value,
            child: const Icon(Icons.favorite, color: Colors.pink),
          ),
        );
      },
    );

    setState(() => hearts.add(heart));

    controller.forward().then((_) {
      setState(() => hearts.remove(heart));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ...hearts,

        /// TAP AREA
        Positioned.fill(
          child: GestureDetector(
            onTap: _addHeart,
            child: Container(color: Colors.transparent),
          ),
        )
      ],
    );
  }
}
