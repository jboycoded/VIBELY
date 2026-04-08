import 'dart:ui';
import 'package:flutter/material.dart';

class LiveTopBar extends StatelessWidget {
  final String name;
  final String title;
  final int viewers;
  final VoidCallback onClose;

  const LiveTopBar({
    super.key,
    required this.name,
    required this.title,
    required this.viewers,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: Row(
            children: [
              /// 👤 PROFILE IMAGE (can be dynamic later)
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/streamer1.jpg"),
              ),
              const SizedBox(width: 10),

              /// 🧾 NAME + TITLE
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 6),

                    /// ➕ FOLLOW BUTTON
                    GestureDetector(
                      onTap: () {
                        // later: follow logic
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Colors.purple,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// 🔴 LIVE BADGE
              _liveBadge(),
              const SizedBox(width: 10),

              /// 👁️ VIEWERS
              const Icon(Icons.remove_red_eye, color: Colors.white70),
              const SizedBox(width: 4),
              Text(
                viewers.toString(),
                style: const TextStyle(color: Colors.white),
              ),

              const SizedBox(width: 10),

              /// ❌ EXIT BUTTON (NOW CONTROLLED BY PARENT)
              GestureDetector(
                onTap: onClose,
                child: const Icon(Icons.close, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _liveBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text(
        "LIVE",
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
