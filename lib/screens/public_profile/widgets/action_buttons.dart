import 'package:flutter/material.dart';
import '../../../models/user_model.dart';

class ActionButtons extends StatelessWidget {
  final UserModel user;

  const ActionButtons({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final isFollowing = user.isFollowing; // from your model

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          /// 🔥 FOLLOW BUTTON
          Expanded(
            child: GestureDetector(
              onTap: () {
                // TODO: follow/unfollow logic
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: isFollowing
                      ? null
                      : LinearGradient(
                          colors: [
                            Colors.pinkAccent,
                            Colors.purpleAccent,
                          ],
                        ),
                  color: isFollowing
                      ? Colors.white.withOpacity(0.1)
                      : null,
                ),
                child: Center(
                  child: Text(
                    isFollowing ? "Following" : "+ Follow",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          /// 💬 CHAT BUTTON
          Expanded(
            child: GestureDetector(
              onTap: () {
                // TODO: open chat
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white.withOpacity(0.08),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Chat",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
