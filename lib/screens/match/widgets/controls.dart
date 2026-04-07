import 'package:flutter/material.dart';

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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: active ? Colors.red : Colors.white12,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  Widget _mainBtn(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Colors.pink, Colors.purple],
          ),
        ),
        child: const Icon(Icons.arrow_upward, color: Colors.white),
      ),
    );
  }

  Widget _endBtn(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 55,
        height: 55,
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.call_end, color: Colors.white),
      ),
    );
  }
}
