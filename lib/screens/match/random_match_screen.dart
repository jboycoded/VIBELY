import 'dart:ui';
import 'package:flutter/material.dart';

import 'video_call_screen.dart';

class RandomMatchScreen extends StatefulWidget {
  const RandomMatchScreen({super.key});

  @override
  State<RandomMatchScreen> createState() => _RandomMatchScreenState();
}

class _RandomMatchScreenState extends State<RandomMatchScreen>
    with SingleTickerProviderStateMixin {
  bool isSearching = false;

  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _scaleAnim =
        Tween<double>(begin: 1, end: 1.2).animate(_controller);

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

    void startMatch() {
    setState(() => isSearching = true);

    // This simulates the search delay and then navigates
    Future.delayed(const Duration(seconds: 3), () {
      // Check if the user is still on this screen and still searching
      if (!mounted || !isSearching) return;

      setState(() => isSearching = false);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const VideoCallScreen(),
        ),
      );
    });
  } // <--- Only ONE closing brace here


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// BACKGROUND
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/login_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        /// DARK OVERLAY
        Container(color: Colors.black.withOpacity(0.6)),

        SafeArea(
          child: Column(
            children: [
              /// TOP BAR
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    const SizedBox(width: 50),
                    Text(
                      "Random Match",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.tune, color: Colors.white),
                  ],
                ),
              ),

              const Spacer(),

              /// CENTER CONTENT
              Column(
                children: [
                  /// USER AVATAR (ANIMATED)
                  ScaleTransition(
                    scale: _scaleAnim,
                    child: const CircleAvatar(
                      radius: 70,
                      backgroundImage:
                          AssetImage("assets/images/streamer1.jpg"),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    isSearching
                        ? "Searching for a match..."
                        : "Find someone to vibe with",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// MATCH BUTTON
                  GestureDetector(
                    onTap: startMatch,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF7B3BFF),
                            Color(0xFFFF4D8D),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:
                                const Color(0xFF9C27B0).withOpacity(0.6),
                            blurRadius: 15,
                          )
                        ],
                      ),
                      child: Text(
                        isSearching ? "Matching..." : "Start Matching",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// CANCEL BUTTON
                  if (isSearching)
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isSearching = false;
                        });
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                ],
              ),

              const Spacer(),

              /// BOTTOM OPTIONS (FILTERS)
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _filterButton(Icons.male, "Male"),
                    _filterButton(Icons.female, "Female"),
                    _filterButton(Icons.public, "Global"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _filterButton(IconData icon, String label) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.white12),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.white70, size: 18),
              const SizedBox(width: 5),
              Text(label,
                  style: const TextStyle(color: Colors.white70)),
            ],
          ),
        ),
      ),
    );
  }
}
