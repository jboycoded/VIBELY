import 'dart:ui';
import 'package:flutter/material.dart';

class FullGalleryScreen extends StatefulWidget {
  final List<String> photos;
  final int initialIndex;
  final String userId;

  const FullGalleryScreen({
    super.key,
    required this.photos,
    required this.initialIndex,
    required this.userId,
  });

  @override
  State<FullGalleryScreen> createState() => _FullGalleryScreenState();
}

class _FullGalleryScreenState extends State<FullGalleryScreen> {
  late PageController _controller;
  int current index! = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _controller = PageController(initialPage: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta! > 12) {
            Navigator.pop(context); // swipe down to dismiss
          }
        },
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: widget.photos.length,
              onPageChanged: (i) => setState(() => currentIndex = i),
              itemBuilder: (_, i) {
                return Center(
                  child: Hero(
                    tag: "photo_${widget.userId}_$i",
                    child: InteractiveViewer(
                      child: Image.network(
                        widget.photos[i],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
            ),

            /// top bar
            Positioned(
              top: 40,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    "${currentIndex + 1}/${widget.photos.length}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
