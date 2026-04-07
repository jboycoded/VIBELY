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
      scrollController.jumpTo(
        scrollController.position.maxScrollExtent,
      );
    });
  }

  void sendGift() {
    GiftOverlay.show(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity! < -300) skipUser();
      },
      child: Stack(
        children: [
          const VideoBackground(),

          const DarkOverlay(),

          const TopBar(),

          const LocalPreview(),

          ChatOverlay(
            messages: messages,
            scrollController: scrollController,
          ),

          InputBar(
            controller: controller,
            onSend: sendMessage,
            onGift: sendGift,
          ),

          Controls(
            isMuted: isMuted,
            cameraOff: cameraOff,
            onMute: toggleMute,
            onCamera: toggleCamera,
            onEnd: endCall,
            onSkip: skipUser,
          ),

          FloatingHearts(key: heartKey),
          //Trigger on double tap or a button
          //heartKey.currentState?.addHeart();
        ],
      ),
    );
  }
}
