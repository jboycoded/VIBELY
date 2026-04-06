import 'package:flutter/material.dart';

// Categories
import '../../categories/popular_category.dart';
import '../../categories/featured_category.dart';
import '../../categories/nearby_category.dart';
import '../../categories/following_category.dart';
import '../../categories/explore_category.dart';

class Livestreams extends StatefulWidget {
  const Livestreams({super.key});

  @override
  State<Livestreams> createState() => _LivestreamsState();
}

class _LivestreamsState extends State<Livestreams> {
  final List<String> categories = [
    "Trending 🔥",
    "Around You 📍",
    "Spotlight 🌟",
    "Following",
    "Discover ✨",
  ];

  late PageController _pageController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
                  children: [
                    /// LOGO
                    Row(
                      children: [
                        Image.asset("assets/images/vibely_icon.jpg",
                            height: 28),
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

                    /// ACTIONS
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.search, color: Colors.white),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.notifications,
                              color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// CATEGORY TABS
              SizedBox(
                height: 45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return categoryButton(categories[index], index);
                  },
                ),
              ),

              const SizedBox(height: 10),

              /// PAGE VIEW (SWIPE)
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  children: const [
                    PopularCategory(),
                    NearbyCategory(),
                    FeaturedCategory(),
                    FollowingCategory(),
                    ExploreCategory(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget categoryButton(String text, int index) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() => selectedIndex = index);

        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFF9C27B0)
                : Colors.white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.white12),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: const Color(0xFF9C27B0).withOpacity(0.6),
                      blurRadius: 12,
                    )
                  ]
                : [],
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight:
                  isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
