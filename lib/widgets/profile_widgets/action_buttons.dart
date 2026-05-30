import 'dart:ui';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        /// FOLLOW BUTTON
        Expanded(
          child: _PremiumActionButton(
            title: "Follow",
            icon: Icons.add_rounded,
            isPrimary: false,
          ),
        ),

        const SizedBox(width: 14),

        /// CHAT BUTTON
        Expanded(
          child: _PremiumActionButton(
            title: "Chat",
            icon: Icons.message_rounded,
            isPrimary: false,
          ),
        ),
      ],
    );
  }
}

class _PremiumActionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isPrimary;

  const _PremiumActionButton({
    required this.title,
    required this.icon,
    required this.isPrimary,
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

            gradient: isPrimary
                ? const LinearGradient(
                    colors: [
                      Color(0xFFFF4D8D),
                      Color(0xFF9B4DFF),
                    ],
                  )
                : null,

            color: isPrimary
                ? null
                : Colors.white.withOpacity(0.07),

            borderRadius: BorderRadius.circular(26),

            border: Border.all(
              color: Colors.white.withOpacity(
                isPrimary ? 0.12 : 0.08,
              ),
            ),

            boxShadow: [
              BoxShadow(
                color: isPrimary
                    ? const Color(0xFFFF4D8D)
                        .withOpacity(0.18)
                    : Colors.black.withOpacity(0.18),

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
                  color: isPrimary
                      ? Colors.white.withOpacity(0.16)
                      : Colors.white.withOpacity(0.08),

                  borderRadius:
                      BorderRadius.circular(16),

                  border: Border.all(
                    color: Colors.white.withOpacity(0.08),
                  ),
                ),

                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 22,
                ),
              ),

              const SizedBox(width: 14),

              /// TEXT
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.2,
                  ),
                ),
              ),

              /// ARROW
              /*
              Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white.withOpacity(0.8),
                size: 20,
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
