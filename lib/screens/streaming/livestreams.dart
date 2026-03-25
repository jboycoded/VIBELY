import 'package:flutter/material.dart';

import 'viewer_live_screen.dart';

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

          /// BACKGROUND IMAGE
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// DARK OVERLAY
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          
          SafeArea(
        child: Column(

          children: [

            /// TOP BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20,vertical:10),

              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  /// APP LOGO
                  Row(
                    children: [

                      Image.asset(
                        "assets/images/vibely_icon.jpg",
                        height: 28,
                      ),

                      const SizedBox(width:8),

                      const Text(
                        "VIBELY",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),

                  /// SEARCH + FILTER BUTTONS
                  Row(
                    children: [

                      IconButton(
                        icon: const Icon(Icons.search,color: Colors.white),
                        onPressed: (){},
                      ),

                      IconButton(
                        icon: const Icon(Icons.tune,color: Colors.white),
                        onPressed: (){},
                      ),

                    ],
                  )

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

            const SizedBox(height:10),

            /// LIVE STREAM GRID
            Expanded(

              child: GridView.count(

                crossAxisCount: 2,

                childAspectRatio: 0.75,

                padding: const EdgeInsets.all(12),

                children: [

                  liveCard(context,"Lovisa","2.3K","assets/images/stream1.jpg"),
                  liveCard(context,"David","801","assets/images/stream2.jpg"),
                  liveCard(context,"Mia","530","assets/images/stream3.jpg"),
                  liveCard(context,"Jenny","167","assets/images/stream4.jpg"),
                  liveCard(context,"Lovisa","2.3K","assets/images/stream1.jpg"),
                  liveCard(context,"David","801","assets/images/stream2.jpg"),
                  liveCard(context,"Mia","530","assets/images/stream3.jpg"),
                  liveCard(context,"Jenny","167","assets/images/stream4.jpg"),
                  

                ],
              ),
            )

          ],
        ),
      ),
          ]
      );
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
          color: isSelected
              ? const Color(0xFF9C27B0) // 🔥 Purple highlight
              : const Color(0xFF1A1435),

          borderRadius: BorderRadius.circular(20),

          /// Optional glow effect
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


/// LIVE STREAM CARD
Widget liveCard(BuildContext context, String name, String viewers, String image) {
  return GestureDetector(
    onTap: () {
      /// 👉 Navigate to Viewer Screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ViewerLiveScreen(),
        ),
      );
    },

    child: Padding(
      padding: const EdgeInsets.all(6),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),

        child: Stack(
          children: [

            /// STREAM IMAGE
            Positioned.fill(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),

            /// LIVE TAG
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "LIVE",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),

            /// VIEWERS COUNT
            Positioned(
              top: 10,
              right: 10,
              child: Row(
                children: [
                  const Icon(Icons.remove_red_eye, color: Colors.white, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    viewers,
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),

            /// STREAMER NAME
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
}
