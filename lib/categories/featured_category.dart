import 'package:flutter/material.dart';
import '../screens/streaming/live_screen.dart';

class FeaturedCategory extends StatelessWidget {
  const FeaturedCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (context, index) {
        return const FeaturedLiveCard();
      },
    );
  }
}

class FeaturedLiveCard extends StatelessWidget {
  const FeaturedLiveCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// BACKGROUND IMAGE
        Positioned.fill(
          child: Image.asset(
            "assets/images/streamer1.jpg",
            fit: BoxFit.cover,
          ),
        ),

        /// OVERLAY
        Container(color: Colors.black.withOpacity(0.4)),

        /// CONTENT
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Spacer(),

              /// CENTER BUTTON
              Center(
                child: GestureDetector(
                  onTap: () {
        // TODO: navigate to live screen
        Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const LiveScreen(),
    ),
  );
      },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 22, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white24),
                    color: Colors.black.withOpacity(0.3),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.wifi_tethering, color: Colors.purple),
                      SizedBox(width: 10),
                      Text(
                        "Tap to watch LIVE",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                  ),
              ),

              const Spacer(),

              /// USER INFO
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Moni 💵",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.remove_red_eye, color: Colors.white),
                  SizedBox(width: 5),
                  Text("532", style: TextStyle(color: Colors.white)),
                ],
              ),
                ),

              Container(
  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  decoration: BoxDecoration(
    color: Colors.black.withOpacity(0.3), // 👈 Makes text "pop" over video
    borderRadius: BorderRadius.circular(20),
  ),
  child: Text(
    "Topic: Flutter Live Session",
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(color: Colors.white),
  ),
)
            ],
          ),
        ),
      ],
    );
  }
}
