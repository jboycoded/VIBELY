import 'dart:ui';
import 'package:flutter/material.dart';

import '../../models/badge_model.dart';

class BadgesSection extends StatelessWidget {
  final List<BadgeModel> badges;

  const BadgesSection({
    super.key,
    required this.badges,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),

        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 20,
            sigmaY: 20,
          ),

          child: Container(
            padding: const EdgeInsets.all(22),

            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06),

              borderRadius: BorderRadius.circular(30),

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

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                /// HEADER
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                  children: [

                    const Text(
                      "Achievements",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.3,
                      ),
                    ),

                    Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.white
                            .withOpacity(0.06),

                        borderRadius:
                            BorderRadius.circular(20),

                        border: Border.all(
                          color: Colors.white
                              .withOpacity(0.08),
                        ),
                      ),

                      child: Row(
                        children: [

                          Text(
                            "View All",
                            style: TextStyle(
                              color: Colors.white
                                  .withOpacity(0.7),

                              fontSize: 12,
                              fontWeight:
                                  FontWeight.w600,
                            ),
                          ),

                          const SizedBox(width: 4),

                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 12,
                            color: Colors.white
                                .withOpacity(0.7),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 22),

                /// EMPTY STATE
                if (badges.isEmpty)
                  Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(
                        vertical: 12,
                      ),

                      child: Text(
                        "No badges yet",
                        style: TextStyle(
                          color: Colors.white
                              .withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),

                /// BADGES
                if (badges.isNotEmpty)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics:
                        const BouncingScrollPhysics(),

                    child: Row(
                      children: badges.map((badge) {

                        return _PremiumBadgeItem(
                          badge: badge,
                        );

                      }).toList(),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PremiumBadgeItem extends StatelessWidget {
  final BadgeModel badge;

  const _PremiumBadgeItem({
    required this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 92,

      margin: const EdgeInsets.only(
        right: 16,
      ),

      child: Column(
        children: [

          /// BADGE CONTAINER
          Container(
            width: 78,
            height: 78,

            padding: const EdgeInsets.all(14),

            decoration: BoxDecoration(

              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,

                colors: [

                  const Color(0xFFFF4D8D)
                      .withOpacity(0.22),

                  const Color(0xFF9B4DFF)
                      .withOpacity(0.22),
                ],
              ),

              borderRadius:
                  BorderRadius.circular(26),

              border: Border.all(
                color: Colors.white
                    .withOpacity(0.08),
              ),

              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF9B4DFF)
                      .withOpacity(0.12),

                  blurRadius: 18,
                  spreadRadius: 2,
                ),
              ],
            ),

            child: badge.imageUrl.startsWith('http')

                ? Image.network(
                    badge.imageUrl,
                    fit: BoxFit.contain,

                    errorBuilder:
                        (_, __, ___) {

                      return const Icon(
                        Icons.workspace_premium_rounded,
                        color: Colors.amber,
                        size: 34,
                      );
                    },
                  )

                : Image.asset(
                    badge.imageUrl,
                    fit: BoxFit.contain,

                    errorBuilder:
                        (_, __, ___) {

                      return const Icon(
                        Icons.workspace_premium_rounded,
                        color: Colors.amber,
                        size: 34,
                      );
                    },
                  ),
          ),

          const SizedBox(height: 12),

          /// LABEL
          Container(
            padding:
                const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 7,
            ),

            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06),

              borderRadius:
                  BorderRadius.circular(18),

              border: Border.all(
                color: Colors.white
                    .withOpacity(0.08),
              ),
            ),

            child: Text(
              badge.label,

              maxLines: 1,
              overflow: TextOverflow.ellipsis,

              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
