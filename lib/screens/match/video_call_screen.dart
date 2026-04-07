import 'package:flutter/material.dart';

import 'widgets/video_background.dart';
import 'widgets/top_bar.dart';
import 'widgets/local_preview.dart';
import 'widgets/controls.dart';
import 'widgets/chat_overlay.dart';
import 'widgets/input_bar.dart';
import 'widgets/gift_overlay.dart';
import 'widgets/floating_hearts.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final GlobalKey<FloatingHeartsState> heartKey = GlobalKey();

  bool isMuted = false;
  bool cameraOff = false;

  final List<String> messages = [];
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  void toggleMute() => setState(() => isMuted = !isMuted);
  void toggleCamera() => setState(() => cameraOff = !cameraOff);

  void endCall() => Navigator.pop(context);

  void skipUser() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Skipping to next user...")),
    );
  }

  void sendMessage() {
    if (controller.text.trim().isEmpty) return;

    setState(() => messages.add(controller.text));
    controller.clear();

    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.jumpTo(
          scrollController.position.maxScrollExtent,
        );
      }
    });
  }

  void sendGift() {
    GiftOverlay.show(context);
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      onDoubleTap: () => heartKey.currentState?.addHeart(),
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity != null &&
            details.primaryVelocity! < -300) {
          skipUser();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            /// 🎥 VIDEO
            const VideoBackground(),

            /// 🌑 DARK GRADIENT OVERLAY
            const DarkOverlay(),

            /// 🔝 TOP BAR
            const SafeArea(child: TopBar()),

            /// 📹 LOCAL PREVIEW (small camera)
            const Positioned(
              top: 90,
              right: 16,
              child: LocalPreview(),
            ),

            /// 💬 CHAT + INPUT (GROUPED TOGETHER)
            Positioned(
              left: 16,
              right: 16,
              bottom: 110 + bottomInset,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChatOverlay(
                    messages: messages,
                    scrollController: scrollController,
                  ),
                  const SizedBox(height: 10),
                  InputBar(
                    controller: controller,
                    onSend: sendMessage,
                    onGift: sendGift,
                  ),
                ],
              ),
            ),

            /// 🎮 CONTROLS (BOTTOM)
            Positioned(
              left: 0,
              right: 0,
              bottom: 20 + bottomInset,
              child: Controls(
                isMuted: isMuted,
                cameraOff: cameraOff,
                onMute: toggleMute,
                onCamera: toggleCamera,
                onEnd: endCall,
                onSkip: skipUser,
              ),
            ),

            /// ❤️ FLOATING HEARTS
            FloatingHearts(key: heartKey),
          ],
        ),
      ),
    );
  }
}
