import 'dart:ui';
import 'package:flutter/material.dart';

import '../../models/user_model.dart';

import '../../widgets/profile_widgets/profile_header.dart';
import '../../widgets/profile_widgets/photo_strip.dart';
import '../../widgets/profile_widgets/profile_stats.dart';
import '../../widgets/profile_widgets/action_buttons.dart';
import '../../widgets/profile_widgets/badges_section.dart';
import '../../widgets/profile_widgets/about_me_section.dart';

class PublicProfileScreen extends StatelessWidget {
  final UserModel user;

  const PublicProfileScreen({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090414),

      body: Stack(
        children: [

          /// BACKGROUND IMAGE
          Positioned.fill(
            child: Image.asset(
              "assets/images/login_bg.png",
              fit: BoxFit.cover,
            ),
          ),

          /// DARK OVERLAY
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.15),
                    const Color(0xFF090414),
                    const Color(0xFF090414),
                  ],
                ),
              ),
            ),
          ),

          /// PURPLE GLOW
          Positioned(
            top: -120,
            right: -50,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF9B4DFF).withOpacity(0.35),
              ),
            ),
          ),

          /// PINK GLOW
          Positioned(
            bottom: 150,
            left: -70,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFFF4D8D).withOpacity(0.22),
              ),
            ),
          ),

          /// BLUR
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 60,
                sigmaY: 60,
              ),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [

                  const _TopBar(),

                  const SizedBox(height: 10),

                  ProfileHeader(user: user),

                  const SizedBox(height: 18),

                  PhotoStrip(photos: user.photos),

                  const SizedBox(height: 28),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [

                        ProfileStats(
                          followers: user.followers,
                          following: user.following,
                        ),

                        const SizedBox(height: 14),

                        const ActionButtons(),

                      ],
                    ),
                  ),

                  const SizedBox(height: 26),
                  AboutMeSection(
                    bio: user.bio,
                  ),
                  
                  const SizedBox(height: 26),
                  BadgesSection(
                    badges: user.badges,
                  ),

                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          _glassIcon(Icons.arrow_back),

          Row(
            children: [
              _glassIcon(Icons.block),
              const SizedBox(width: 10),
              _glassIcon(Icons.flag),
            ],
          ),
        ],
      ),
    );
  }

  Widget _glassIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.white.withOpacity(0.08),
        ),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
