import 'dart:ui';
import 'package:flutter/material.dart';

class ProfileStats extends StatelessWidget {
  final int followers;
  final int following;

  const ProfileStats({
    super.key,
    required this.followers,
    required this.following,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Expanded(
          child: _PremiumStatCard(
            title: "Fans",
            value: followers.toString(),
            icon: Icons.favorite_rounded,
          ),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: _PremiumStatCard(
            title: "Following",
            value: following.toString(),
            icon: Icons.people_alt_rounded,
          ),
        ),
      ],
    );
  }
}

class _PremiumStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _PremiumStatCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(26),

      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 18,
          sigmaY: 18,
        ),

        child: Container(
          height: 88,

          padding: const EdgeInsets.symmetric(
            horizontal: 18,
          ),

          decoration: BoxDecoration(
            gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF1B1448), // A slightly lighter navy for the "glow"
      Color(0xFF15102E), // Your deep midnight navy
    ],
  ),
            borderRadius: BorderRadius.circular(26),

            border: Border.all(
              color: Colors.white.withOpacity(0.08),
            ),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.18),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),

          child: Row(
            children: [

              /// ICON CONTAINER
              Container(
                width: 44,
                height: 44,

                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFFFF4D8D)
                          .withOpacity(0.85),

                      const Color(0xFF9B4DFF)
                          .withOpacity(0.85),
                    ],
                  ),

                  borderRadius:
                      BorderRadius.circular(16),
                ),

                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 22,
                ),
              ),

              const SizedBox(width: 14),

              /// TEXTS
              Expanded(
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Text(
                      value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white
                            .withOpacity(0.65),

                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
