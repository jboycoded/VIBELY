import 'dart:ui';
import 'package:flutter/material.dart';
import '../../models/user_model.dart';
import 'widgets/user_details.dart';
import 'widgets/stats_container.dart';
import 'widgets/action_buttons.dart';
import 'widgets/profile_sections.dart';
import 'widgets/animated_header.dart';

class PublicProfileScreen extends StatefulWidget {
  final UserModel user;

  const PublicProfileScreen({super.key, required this.user});

  @override
  State<PublicProfileScreen> createState() => _PublicProfileScreenState();
}

class _PublicProfileScreenState extends State<PublicProfileScreen> {
  final ScrollController _scrollController = ScrollController();

  double blur = 0;
  double offset = 0;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final newOffset = _scrollController.offset;
      final newBlur = (newOffset / 200).clamp(0, 6).toDouble();
      if ((newBlur - blur).abs() > 0.2) {
        setState(() {
          blur = newBlur;
          offset = newOffset;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.user;

    return Scaffold(
      body: Stack(
        children: [
          /// 🌌 PARALLAX BACKGROUND
          Positioned(
            top: -offset * 0.3,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              "assets/images/login_bg.png",
              fit: BoxFit.cover,
            ),
          ),

          /// 🌫️ BLUR OVERLAY
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: blur,
                sigmaY: blur,
              ),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),

          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                expandedHeight: 280,
                pinned: true,
                backgroundColor: Colors.transparent,

                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {},
                ),

                actions: [
                  IconButton(
                    icon: const Icon(Icons.block),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.flag),
                    onPressed: () {},
                  ),
                ],

                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(user.name),
                  background: LayoutBuilder(
                    builder: (context, constraints) {
                      final top = constraints.biggest.height;
                      final progress =
                          (top - kToolbarHeight) / (280 - kToolbarHeight);

                      return AnimatedHeader(
                        user: user,
                        progress: progress.clamp(0, 1),
                      );
                    },
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    UserDetails(user: user),
                    const SizedBox(height: 16),
                    StatsContainer(user: user),
                    const SizedBox(height: 20),
                    ActionButtons(user: user),
                    const SizedBox(height: 20),
                    ProfileSections(user: user),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
