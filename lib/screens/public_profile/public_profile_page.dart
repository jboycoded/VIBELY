import 'package:flutter/material.dart';
import '../../models/user_model.dart';

import '../../widgets/profile_widgets/profile_header.dart';
import '../../widgets/profile_widgets/photo_strip.dart';
import '../../widgets/profile_widgets/profile_stats.dart';
import '../../widgets/profile_widgets/action_buttons.dart';
import '../../widgets/profile_widgets/info_cards.dart';
import '../../widgets/profile_widgets/badges_section.dart';

class PublicProfileScreen extends StatelessWidget {
  final UserModel user;
  PublicProfileScreen({
    super.key,
    required this.user,
    });

  @override
  Widget build(BuildContext context) {
  
    final photos = [
      "assets/images/streamer1.jpg",
      "assets/images/streamer1.jpg",
      "assets/images/streamer1.jpg",
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0F0B1F),
      body: Stack(
        children: [
          /// BACKGROUND
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// OVERLAY
          Container(color: Colors.black.withOpacity(0.35)),

          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const _TopBar(),

                  ProfileHeader(user: user),

                  PhotoStrip(photos: photos),

                  ProfileStats(),

                  ActionButtons(),

                  const InfoCards(),

                  /// 👉 BADGES GO HERE LATER
                  BadgesSection(badges: user.badges),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 🔝 TOP BAR
class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.arrow_back, color: Colors.white),

          Row(
            children: const [
              Icon(Icons.block, color: Colors.white),
              SizedBox(width: 10),
              Icon(Icons.flag, color: Colors.white),
            ],
          )
        ],
      ),
    );
  }
}
