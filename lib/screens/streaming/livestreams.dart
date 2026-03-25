import 'package:flutter/material.dart';
import 'viewer_live_screen.dart';

// Import category widgets
import '../../categories/popular.dart';
import '../../categories/featured.dart';
import '../../categories/nearby.dart';
import '../../categories/following.dart';
import '../../categories/explore.dart';

class Livestreams extends StatefulWidget {
  const Livestreams({super.key});

  @override
  State<Livestreams> createState() => _LivestreamsState();
}

class _LivestreamsState extends State<Livestreams> {
  String selectedCategory = "Popular";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/login_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Dark overlay
        Container(color: Colors.black.withOpacity(0.5)),

        SafeArea(
          child: Column(
            children: [
              /// TOP BAR
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Logo
                    Row(
                      children: [
                        Image.asset("assets/images/vibely_icon.jpg", height: 28),
                        const SizedBox(width: 8),
                        const Text(
                          "VIBELY",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    // Search + Filter
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.search, color: Colors.white),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.tune, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// CATEGORY BUTTONS
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    categoryButton("Popular"),
                    categoryButton("Nearby"),
                    categoryButton("Featured"),
                    categoryButton("Following"),
                    categoryButton("Explore"),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              /// LIVE STREAM GRID (Modular)
              Expanded(
                child: getSelectedCategoryWidget(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Returns widget for selected category
  Widget getSelectedCategoryWidget() {
    switch (selectedCategory) {
      case "Popular":
        return const PopularCategory();
      case "Featured":
        return const FeaturedCategory();
      case "Nearby":
        return const NearbyCategory();
      case "Following":
        return const FollowingCategory();
      case "Explore":
        return const ExploreCategory();
      default:
        return const PopularCategory();
    }
  }

  /// CATEGORY BUTTON
  Widget categoryButton(String text) {
    final bool isSelected = selectedCategory == text;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = text;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF9C27B0) : const Color(0xFF1A1435),
            borderRadius: BorderRadius.circular(20),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: const Color(0xFF9C27B0).withOpacity(0.5),
                      blurRadius: 8,
                    )
                  ]
                : [],
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}        
