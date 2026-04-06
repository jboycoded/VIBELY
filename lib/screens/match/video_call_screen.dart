import 'dart:ui';
import 'package:flutter/material.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  bool isMuted = false;
  bool cameraOff = false;

  void toggleMute() {
    setState(() => isMuted = !isMuted);
  }

  void toggleCamera() {
    setState(() => cameraOff = !cameraOff);
  }

  void endCall() {
    Navigator.pop(context);
  }

  void skipUser() {
    // later connect to matching system
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Skipping to next user...")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity! < -300) {
          skipUser(); // swipe up to skip
        }
      },
      child: Stack(
        children: [
          /// REMOTE VIDEO (placeholder)
          Positioned.fill(
            child: Image.asset(
              "assets/images/streamer1.jpg",
              fit: BoxFit.cover,
            ),
          ),

          /// DARK OVERLAY
          Container(color: Colors.black.withOpacity(0.3)),

          /// TOP BAR
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Live Match",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.flag, color: Colors.white),
                ],
              ),
            ),
          ),

          /// LOCAL VIDEO (small preview)
          Positioned(
            top: 100,
            right: 16,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 140,
                width: 100,
                color: Colors.black,
                child: Image.asset(
                  "assets/images/streamer1.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          /// BOTTOM CONTROLS
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Column(
              children: [
                /// ACTION BUTTONS
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _controlButton(
                      icon: isMuted ? Icons.mic_off : Icons.mic,
                      onTap: toggleMute,
                    ),
                    _endCallButton(),
                    _controlButton(
                      icon: cameraOff ? Icons.videocam_off : Icons.videocam,
                      onTap: toggleCamera,
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// EXTRA ACTIONS
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _glassButton(Icons.card_giftcard, "Gift"),
                    _glassButton(Icons.chat, "Chat"),
                    _glassButton(Icons.skip_next, "Skip"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _controlButton({required IconData icon, required VoidCallback onTap}) {
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

  Widget _endCallButton() {
    return GestureDetector(
      onTap: endCall,
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

  Widget _glassButton(IconData icon, String label) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(height: 5),
              Text(label,
                  style: const TextStyle(color: Colors.white70)),
            ],
          ),
        ),
      ),
    );
  }
}
