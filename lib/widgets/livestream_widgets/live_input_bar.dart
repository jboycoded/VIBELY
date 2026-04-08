import 'dart:ui';
import 'package:flutter/material.dart';

class LiveInputBar extends StatelessWidget {
  final Function(String) onSend;

  const LiveInputBar({
    super.key,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// 💬 INPUT (TAP TO OPEN SHEET)
        Expanded(
          child: GestureDetector(
            onTap: () => _openInputSheet(context),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: const [
                      Text(
                        "Say something...",
                        style: TextStyle(color: Colors.white70),
                      ),
                      Spacer(),
                      Icon(Icons.edit, color: Colors.white54, size: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 10),

        _icon(Icons.emoji_emotions),
        const SizedBox(width: 8),
        _icon(Icons.menu),
      ],
    );
  }

  /// 🧾 BOTTOM SHEET INPUT
  void _openInputSheet(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(25)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                ),
                child: Row(
                  children: [
                    /// ✍ TEXT FIELD
                    Expanded(
                      child: TextField(
                        controller: controller,
                        autofocus: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: "Type a message...",
                          hintStyle: TextStyle(color: Colors.white54),
                          border: InputBorder.none,
                        ),
                        onSubmitted: (value) {
                          _send(context, controller);
                        },
                      ),
                    ),

                    const SizedBox(width: 10),

                    /// 🚀 SEND BUTTON
                    GestureDetector(
                      onTap: () => _send(context, controller),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.purple,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// 📤 SEND LOGIC
  void _send(BuildContext context, TextEditingController controller) {
    final text = controller.text.trim();

    if (text.isEmpty) return;

    onSend(text); // 🔥 send to parent

    controller.clear();
    Navigator.pop(context);
  }

  Widget _icon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}
