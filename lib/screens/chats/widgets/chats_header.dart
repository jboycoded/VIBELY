import 'package:flutter/material.dart';
import 'chats_tabs.dart'; // Adjust path based on your folder structure

class ChatsHeader extends StatelessWidget {
  final int totalUnread;
  final int selectedTab;
  final Function(int) onTabTap;
  final PageController controller;

  const ChatsHeader({
    super.key,
    required this.totalUnread,
    required this.selectedTab,
    required this.onTabTap,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            const SizedBox(width: 24),

            Expanded(
              child: Center(
                child: ChatsTabs(
                  totalUnread: totalUnread,
                  selectedTab: selectedTab,
                  controller: controller,
                  onTap: onTabTap,
                ),
              ),
            ),

            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
