import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Controls extends StatelessWidget {
  final bool isMuted;
  final bool cameraOff;
  final VoidCallback onMute;
  final VoidCallback onCamera;
  final VoidCallback onEnd;
  final VoidCallback onSkip;

  const Controls({
    super.key,
    required this.isMuted,
    required this.cameraOff,
    required this.onMute,
    required this.onCamera,
    required this.onEnd,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _btn(Icons.mic, onMute, isMuted),
        _btn(Icons.videocam, onCamera, cameraOff),
        _mainBtn(onSkip),
        _btn(Icons.more_horiz, () {}, false),
        _endBtn(onEnd),
      ],
    );
  }

  Widget _btn(IconData icon, VoidCallback onTap, bool active) {
    return _ScaleButton(
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: active
                  ? Colors.red.withOpacity(0.6)
                  : Colors.white.withOpacity(0.08),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white24),
            ),
            child: Icon(icon, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _mainBtn(VoidCallback onTap) {
    return _ScaleButton(
      onTap: () {
        HapticFeedback.mediumImpact();
        onTap();
      },
      child: Container(
        width: 68,
        height: 68,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [Colors.pink, Colors.purple],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.pink.withOpacity(0.7),
              blurRadius: 20,
            ),
          ],
        ),
        child: const Icon(Icons.arrow_upward, color: Colors.white),
      ),
    );
  }

  Widget _endBtn(VoidCallback onTap) {
    return _ScaleButton(
      onTap: () {
        HapticFeedback.heavyImpact();
        onTap();
      },
      child: Container(
        width: 58,
        height: 58,
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.call_end, color: Colors.white),
      ),
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
