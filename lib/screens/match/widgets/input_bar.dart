import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onGift;

  const InputBar({
    super.key,
    required this.controller,
    required this.onSend,
    required this.onGift,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white24),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Send a message...',
                    hintStyle: TextStyle(color: Colors.white54),
                  ),
                ),
              ),
              _pressBtn(Icons.card_giftcard, Colors.pinkAccent, () {
                HapticFeedback.lightImpact();
                onGift();
              }),
              _pressBtn(Icons.send, Colors.white, () {
                HapticFeedback.lightImpact();
                onSend();
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pressBtn(IconData icon, Color color, VoidCallback onTap) {
    return _ScaleButton(
      onTap: onTap,
      child: Icon(icon, color: color),
    );
  }
}

class _ScaleButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  const _ScaleButton({required this.child, required this.onTap});

  @override
  State<_ScaleButton> createState() => _ScaleButtonState();
}

class _ScaleButtonState extends State<_ScaleButton> {
  double scale = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => scale = 0.9),
      onTapUp: (_) => setState(() => scale = 1),
      onTapCancel: () => setState(() => scale = 1),
      onTap: widget.onTap,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 120),
        scale: scale,
        child: widget.child,
      ),
    );
  }
}
