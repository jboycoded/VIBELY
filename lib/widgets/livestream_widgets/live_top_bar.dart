import 'dart:ui';
import 'package:flutter/material.dart';

class LiveTopBar extends StatelessWidget {
  const LiveTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: const Image.asset(
                    "assets/images/streamer1.jpg"),
              ),
              const SizedBox(width: 10),

              const Expanded(
                child: Text(
                  "Cydknee",
                  style: TextStyle(color: Colors.white),
                ),
              ),

              _liveBadge(),
              const SizedBox(width: 10),

              const Icon(Icons.remove_red_eye, color: Colors.white70),
              const SizedBox(width: 4),
              const Text("534", style: TextStyle(color: Colors.white)),

              const SizedBox(width: 10),

              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 18),
              )
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
