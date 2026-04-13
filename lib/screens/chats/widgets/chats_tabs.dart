import 'package:flutter/material.dart';

class ChatsTabs extends StatelessWidget {
  final int totalUnread;
  final int selectedTab;
  final PageController controller;
  final Function(int) onTap;

  const ChatsTabs({
    super.key,
    required this.totalUnread,
    required this.selectedTab,
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        double tabWidth = constraints.maxWidth / 2;

        return Column(
          children: [

            Row(
              children: [
                Expanded(child: _tab("Messages", Icons.chat, 0)),
                Expanded(child: _tab("Calls", Icons.call, 1)),
              ],
            ),

            const SizedBox(height: 5),

            AnimatedBuilder(
              animation: controller,
              builder: (_, __) {
                double pos =
                    controller.hasClients ? controller.page ?? 0 : 0;

                return Align(
                alignment: Alignment.centerLeft,
                child: Transform.translate(
                  offset: Offset(pos * tabWidth, 0),
                  child: Container(
                    width: tabWidth,
                    height: 3,
                    decoration: BoxDecoration(
                      color: const Color(0xFF9C27B0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              );
              },
            )
          ],
        );
      },
    );
  }

  Widget _tab(String text, IconData icon, int index) {
    final isSelected = selectedTab == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
            icon,
            color: isSelected ? Colors.white : Colors.white54,
          ),

          const SizedBox(width: 5),

            Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white54,
              ),
            ),

            if (index == 0 && totalUnread > 0)
              Container(
                margin: const EdgeInsets.only(left: 6),
                padding: const EdgeInsets.symmetric(
                    horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "$totalUnread",
                  style: const TextStyle(fontSize: 10, color: Colors.white),
                ),
              )
          ],
        ),
      ),
    );
  }
}
