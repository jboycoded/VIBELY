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
    return Positioned(
      bottom: 80,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _btn(isMuted ? Icons.mic_off : Icons.mic, onMute),
              _endBtn(onEnd),
              _btn(cameraOff ? Icons.videocam_off : Icons.videocam, onCamera),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _glass(Icons.skip_next, "Skip", onSkip),
            ],
          ),
        ],
      ),
    );
  }

  Widget _btn(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.1),
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  Widget _endBtn(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 65,
        width: 65,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
        child: const Icon(Icons.call_end, color: Colors.white),
      ),
    );
  }

  Widget _glass(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}
