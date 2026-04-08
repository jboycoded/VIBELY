import 'dart:math';
import 'package:flutter/material.dart';

class ReactionsOverlay extends StatefulWidget {
  const ReactionsOverlay({super.key});

  @override
  State<ReactionsOverlay> createState() => ReactionsOverlayState();
}

class ReactionsOverlayState extends State<ReactionsOverlay>
    with TickerProviderStateMixin {
  final List<ReactionItem> reactions = [];
  final Random _random = Random();

  /// ❤️ PUBLIC METHOD (CALL THIS TO ADD REACTION)
  void addReaction({String? emoji, String? asset}) {
    final id = DateTime.now().millisecondsSinceEpoch;

    final controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000 + _random.nextInt(1000)),
    );

    final animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    );

    final item = ReactionItem(
      id: id,
      emoji: emoji,
      asset: asset,
      animation: animation,
      controller: controller,
      startX: 0.7 + _random.nextDouble() * 0.2, // right side
      endX: _random.nextDouble(), // random horizontal drift
      rotation: (_random.nextDouble() - 0.5) * 0.6,
      size: 20.0 + _random.nextDouble() * 10,
    );

    setState(() {
      reactions.add(item);
    });

    controller.forward();

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
        setState(() {
          reactions.removeWhere((e) => e.id == id);
        });
      }
    });
  }

  /// 🔥 MULTI BURST (FOR GIFTS)
  void burstReactions({String? emoji, String? asset, int count = 6}) {
    for (int i = 0; i < count; i++) {
      Future.delayed(Duration(milliseconds: i * 120), () {
        addReaction(emoji: emoji, asset: asset);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: reactions.map((reaction) {
          return AnimatedBuilder(
            animation: reaction.animation,
            builder: (context, child) {
  final progress = reaction.animation.value;

  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;

  /// 🌊 CURVED FLOAT (sine wave)
  final curveOffset = sin(progress * pi * 2) * 20;

  final x = screenWidth *
      (reaction.startX +
          (reaction.endX - reaction.startX) * progress) +
      curveOffset;

  final y = screenHeight * (1 - progress);

  /// ✨ SCALE (pop in → float → fade)
  double scale;
  if (progress < 0.2) {
    scale = 0.5 + (progress * 2.5); // pop in
  } else {
    scale = 1.0 - (progress * 0.3); // slight shrink
  }

  final opacity = 1 - progress;

  return Positioned(
    left: x,
    bottom: y,
    child: Opacity(
      opacity: opacity,
      child: Transform.rotate(
        angle: reaction.rotation * progress,
        child: Transform.scale(
          scale: scale,
          child: reaction.asset != null
              ? Image.asset(
                  reaction.asset!,
                  width: reaction.size,
                  height: reaction.size,
                )
              : Text(
                  reaction.emoji ?? "❤️",
                  style: TextStyle(fontSize: reaction.size),
                ),
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
class ReactionItem {
  final int id;
  final String? emoji;
final String? asset;
  final Animation<double> animation;
  final AnimationController controller;
  final double startX;
  final double endX;
  final double rotation;
  final double size;

  ReactionItem({
    required this.id,
    this.emoji,
    this.asset,
    required this.animation,
    required this.controller,
    required this.startX,
    required this.endX,
    required this.rotation,
    required this.size,
  });
}
