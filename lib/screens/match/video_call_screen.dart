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
  final GlobalKey<FloatingHeartsState> heartKey =
      GlobalKey<FloatingHeartsState>();

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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: GestureDetector(
          onDoubleTap: () => heartKey.currentState?.addHeart(),
          onVerticalDragEnd: (details) {
            if (details.primaryVelocity != null &&
                details.primaryVelocity! < -300) {
              skipUser();
            }
          },
          child: Stack(
            children: [
              /// 🔹 Background (FULL SCREEN)
              const Positioned.fill(child: VideoBackground()),

              /// 🔹 Dark overlay for readability
              const Positioned.fill(child: DarkOverlay()),

              /// 🔹 Top Bar (Safe & constrained)
              const Positioned(
                top: 10,
                left: 10,
                right: 10,
                child: TopBar(),
              ),

              /// 🔹 Remote video placeholder (center area safe)
              Positioned.fill(
                child: Center(
                  child: Container(), // replace with video later
                ),
              ),

              /// 🔹 Local preview (top-right corner safe)
              Positioned(
                top: 70,
                right: 16,
                child: const LocalPreview(),
              ),

              /// 🔹 Chat overlay (above input)
              Positioned(
                left: 12,
                right: 80,
                bottom: 150,
                child: ChatOverlay(
                  messages: messages,
                  scrollController: scrollController,
                ),
              ),

              /// 🔹 Input bar (bottom safe)
              Positioned(
                left: 12,
                right: 12,
                bottom: 100,
                child: InputBar(
                  controller: controller,
                  onSend: sendMessage,
                  onGift: sendGift,
                ),
              ),

              /// 🔹 Controls (BOTTOM CENTER SAFE)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Controls(
                    isMuted: isMuted,
                    cameraOff: cameraOff,
                    onMute: toggleMute,
                    onCamera: toggleCamera,
                    onEnd: endCall,
                    onSkip: skipUser,
                  ),
                ),
              ),

              /// 🔹 Floating hearts (CLIPPED TO SCREEN)
              Positioned.fill(
                child: ClipRect(
                  child: FloatingHearts(key: heartKey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


