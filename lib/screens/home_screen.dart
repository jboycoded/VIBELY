import 'dart:ui';
import 'package:flutter/material.dart';

import 'match/random_match_screen.dart';
import 'streaming/livestreams.dart';
import 'chats/chat_screen.dart';
import 'profile/profile_screen.dart';
import 'golive/go_live_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> pages = [
    const Livestreams(),
    const RandomMatchScreen(),
    const SizedBox(),
    const ChatsScreen(),
    const ProfileScreen(),
  ];

  int selectedIndex = 0;

  void onItemTapped(int index) {
    if (index == 2) return;
    setState(() => selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0A1F),
      body: Stack(
        children: [
          pages[selectedIndex],

          /// NAV BAR
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: _buildNavBar(),
            ),
          ),

          /// GO LIVE BUTTON
          _goLiveButton(),
        ],
      ),
    );
  }

  Widget _buildNavBar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(35),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(35),
            border: Border.all(color: Colors.white12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _navItem(Icons.home, 0),
              _navItem(Icons.shuffle, 1),
              const SizedBox(width: 60),
              _navItem(Icons.chat_bubble_outline, 3),
              _navItem(Icons.person_outline, 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, int index) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? const Color(0xFF9C27B0).withOpacity(0.2)
              : Colors.transparent,
        ),
        child: Icon(
          icon,
          color: isSelected
              ? const Color(0xFF9C27B0)
              : Colors.white70,
          size: isSelected ? 28 : 24,
        ),
      ),
    );
  }

  Widget _goLiveButton() {
    return Positioned(
      bottom: 26,
      left: MediaQuery.of(context).size.width / 2 - 30,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const GoLiveScreen(),
            ),
          );
        },
        child: Container(
          height: 50,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [
                Color(0xFF7B3BFF),
                Color(0xFFFF4D8D),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF9C27B0).withOpacity(0.6),
                blurRadius: 20,
              ),
            ],
          ),
          child: const Icon(Icons.videocam, color: Colors.white),
        ),
      ),
    );
  }
}
