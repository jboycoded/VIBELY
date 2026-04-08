import 'dart:math';
import 'package:flutter/material.dart';

class ReactionsOverlay extends StatefulWidget {
  const ReactionsOverlay({super.key});

  @override
  State<ReactionsOverlay> createState() => _ReactionsOverlayState();
}

class _ReactionsOverlayState extends State<ReactionsOverlay>
    with TickerProviderStateMixin {
  final List<_ReactionItem> _reactions = [];
  final Random _random = Random();

  /// ❤️ PUBLIC METHOD (CALL THIS TO ADD REACTION)
  void addReaction({String emoji = "❤️"}) {
    final id = DateTime.now().millisecondsSinceEpoch;

    final controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000 + _random.nextInt(1000)),
    );

    final animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    );

    final item = _ReactionItem(
      id: id,
      emoji: emoji,
      animation: animation,
      controller: controller,
      startX: 0.7 + _random.nextDouble() * 0.2, // right side
      endX: _random.nextDouble(), // random horizontal drift
      rotation: (_random.nextDouble() - 0.5) * 0.6,
      size: 20.0 + _random.nextDouble() * 10,
    );

    setState(() {
      _reactions.add(item);
    });

    controller.forward();

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
        setState(() {
          _reactions.removeWhere((e) => e.id == id);
        });
      }
    });
  }

  /// 🔥 MULTI BURST (FOR GIFTS)
  void burstReactions({String emoji = "🎁", int count = 6}) {
    for (int i = 0; i < count; i++) {
      Future.delayed(Duration(milliseconds: i * 120), () {
        addReaction(emoji: emoji);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: _reactions.map((reaction) {
          return AnimatedBuilder(
            animation: reaction.animation,
            builder: (context, child) {
              final progress = reaction.animation.value;

              final y = MediaQuery.of(context).size.height *
                  (1 - progress); // bottom → top

              final x = MediaQuery.of(context).size.width *
                  (reaction.startX +
                      (reaction.endX - reaction.startX) * progress);

              final opacity = 1 - progress;

              return Positioned(
                left: x,
                bottom: y,
                child: Opacity(
                  opacity: opacity,
                  child: Transform.rotate(
                    angle: reaction.rotation * progress,
                    child: Text(
                      reaction.emoji,
                      style: TextStyle(fontSize: reaction.size),
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

/// 🧠 INTERNAL MODEL
class _ReactionItem {
  final int id;
  final String emoji;
  final Animation<double> animation;
  final AnimationController controller;
  final double startX;
  final double endX;
  final double rotation;
  final double size;

  _ReactionItem({
    required this.id,
    required this.emoji,
    required this.animation,
    required this.controller,
    required this.startX,
    required this.endX,
    required this.rotation,
    required this.size,
  });
}
