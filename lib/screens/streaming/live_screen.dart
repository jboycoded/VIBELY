import 'dart:ui';
import 'package:flutter/material.dart';

import '../../widgets/livestream_widgets/live_top_bar.dart';
import '../../widgets/livestream_widgets/live_right_actions.dart';
import '../../widgets/livestream_widgets/live_chat_section.dart';
import '../../widgets/livestream_widgets/live_input_bar.dart';
import '../../widgets/livestream_widgets/reactions_overlay.dart';
import '../../widgets/livestream_widgets/gift_quick_bar.dart';

class LiveScreen extends StatelessWidget {
  const LiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [

          /// 🎥 VIDEO PLACEHOLDER
          Positioned.fill(
            child: Image.asset(
    "assets/images/streamer1.jpg",
              fit: BoxFit.cover,
            ),
          ),

          /// 🌑 GRADIENT OVERLAY (TOP & BOTTOM)
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black54,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black87,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          /// 🔝 TOP BAR
          const Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: LiveTopBar(),
          ),

          /// 👉 RIGHT ACTIONS
          const Positioned(
            right: 10,
            bottom: 120,
            child: LiveRightActions(),
          ),

          /// 💬 CHAT
          const Positioned(
            left: 10,
            right: 80,
            bottom: 140,
            child: LiveChatSection(),
          ),

          // Horizontal scrollable gifts
          const Positioned(
  left: 10,
  right: 10,
  bottom: 70,
  child: GiftQuickBar(),
),

          /// ✍ INPUT
          const Positioned(
            left: 10,
            right: 10,
            bottom: 20,
            child: LiveInputBar(),
          ),

          /// ❤️ FLOATING REACTIONS
          const ReactionsOverlay(),
        ],
      ),
    );
  }
}
