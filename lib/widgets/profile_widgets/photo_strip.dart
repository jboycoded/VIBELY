import 'package:flutter/material.dart';
import '../../screens/public_profile/full_gallery_screen.dart';

class PhotoStrip extends StatelessWidget {
  final List<String> photos;

  const PhotoStrip({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.75),
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FullGalleryScreen(
                    photos: photos,
                    initialIndex: index,
                  ),
                ),
              );
            },
            child: Hero(
              tag: "photo_$index",
              SizedBox(
                width: 100, // Limit width
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(photos[index]),
                    fit: BoxFit.cover,
                  ),
                ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
