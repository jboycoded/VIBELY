import 'package:flutter/material.dart';

class GiftOverlay extends StatefulWidget {
  const GiftOverlay({super.key});

  @override
  State<GiftOverlay> createState() => _GiftOverlayState();
}

class _GiftOverlayState extends State<GiftOverlay>
    with TickerProviderStateMixin {
  String? currentGift;
  late AnimationController controller;
  late Animation<double> scale;
  late Animation<double> opacity;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    scale = CurvedAnimation(
      parent: controller,
      curve: Curves.elasticOut,
    );

    opacity = Tween(begin: 0.0, end: 1.0).animate(controller);
  }

  void showGift(String asset) {
    setState(() {
      currentGift = asset;
    });

    controller.forward(from: 0);

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      controller.reverse().then((_) {
        setState(() {
          currentGift = null;
        });
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentGift == null) return const SizedBox.shrink();

    return IgnorePointer(
      child: Center(
        child: FadeTransition(
          opacity: opacity,
          child: ScaleTransition(
            scale: scale,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                currentGift!,
                width: 120,
                height: 120,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
