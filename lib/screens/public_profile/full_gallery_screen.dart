import 'package:flutter/material.dart';

class FullGalleryScreen extends StatefulWidget {
  final List<String> photos;
  final int initialIndex;

  const FullGalleryScreen({
    super.key,
    required this.photos,
    required this.initialIndex,
  });

  @override
  State<FullGalleryScreen> createState() => _FullGalleryScreenState();
}

class _FullGalleryScreenState extends State<FullGalleryScreen> {
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: controller,
        itemCount: widget.photos.length,
        itemBuilder: (_, i) {
          return Center(
            child: Hero(
              tag: "photo_$i",
              child: Image.asset(widget.photos[i], fit: BoxFit.contain),
            ),
          );
        },
      ),
    );
  }
}
