import 'dart:ui';
import 'package:flutter/material.dart';
import '../../models/user_model.dart';

class ProfileHeader extends StatelessWidget {
  final UserModel user;

  const ProfileHeader({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// PROFILE IMAGE
        Stack(
          alignment: Alignment.bottomRight,
          children: [

            /// OUTER GLOW
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFF4D8D),
                    Color(0xFF9B4DFF),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFF4D8D)
                        .withOpacity(0.35),
                    blurRadius: 30,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.15),
                  ),
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: user.imageFile != null
                      ? FileImage(user.imageFile!)
                      : AssetImage(user.imageUrl)
                          as ImageProvider,
                ),
              ),
            ),

            /// ONLINE / LIVE INDICATOR
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 7,
              ),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFF4D8D),
                    Color(0xFFFF7A59),
                  ],
                ),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.white.withOpacity(0.25),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),

                  const SizedBox(width: 6),

                  Text(
                    user.isLive ? "LIVE" : "ONLINE",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                      letterSpacing: 0.6,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        /// NAME + AGE BADGE
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Flexible(
              child: Text(
                user.name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
              ),
            ),

            const SizedBox(width: 10),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
              child: Row(
                children: [

                  Icon(
                    user.gender == "male"
                        ? Icons.male
                        : Icons.female,
                    size: 15,
                    color: const Color(0xFFFF4D8D),
                  ),

                  const SizedBox(width: 4),

                  Text(
                    "${user.age}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        /// INFO CHIPS
        Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          children: [

            _infoChip(
              icon: Icons.location_on_rounded,
              text: user.country,
            ),

            _infoChip(
      icon: Icons.badge_rounded,
      text: "ID: ${user.id}",
    ),
          ],
        ),

        //const SizedBox(height: 14),

        /// USER ID
        /*
        Text(
          "ID: ${user.id}",
          style: TextStyle(
            color: Colors.white.withOpacity(0.35),
            fontSize: 12,
            letterSpacing: 1.1,
          ),
        ),*/
      ],
    );
  }

  Widget _infoChip({
    required IconData icon,
    required String text,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15,
          sigmaY: 15,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.07),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Colors.white.withOpacity(0.08),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [

              Icon(
                icon,
                size: 16,
                color: const Color(0xFFFF4D8D),
              ),

              const SizedBox(width: 6),

              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
