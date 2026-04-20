import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../models/user_model.dart';
import '../full_gallery_screen.dart';

class AnimatedHeader extends StatefulWidget {
  final UserModel user;
  final double progress;

  const AnimatedHeader({
    super.key,
    required this.user,
    required this.progress,
  });

  @override
  State<AnimatedHeader> createState() => _AnimatedHeaderState();
}

class _AnimatedHeaderState extends State<AnimatedHeader> {
  int selectedIndex = 0;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    final p = widget.progress;

    final avatarSize = 40 + (40 * p);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 60),

        /// 👤 HERO AVATAR
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => FullGalleryScreen(
                  photos: user.photos,
                  initialIndex: selectedIndex,
                  userId: user.id,
                ),
              ),
            );
          },
          child: Hero(
            tag: "photo_${user.id}_$selectedIndex",
            child: Container(
              width: avatarSize,
              height: avatarSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
  image: user.photos[selectedIndex].startsWith('http')
      ? NetworkImage(user.photos[selectedIndex]) as ImageProvider
      : AssetImage(user.photos[selectedIndex]),
  fit: BoxFit.cover,
),

              ),
            ),
          ),
        ),

        SizedBox(height: 12 * p),

            Opacity(
          opacity: p,
          child: SizedBox(
            height: 80,
            child: PageView.builder(
              controller: _controller,
              itemCount: user.photos.length,
              onPageChanged: (i) {
                HapticFeedback.selectionClick();
                setState(() => selectedIndex = i);
              },
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FullGalleryScreen(
                          photos: user.photos,
                          initialIndex: index,
                          userId: user.id,
                        ),
                      ),
                    );
                  },
                  child: Hero(
                    tag: "photo_${user.id}_$index",
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: user.photos[i].startsWith('http')
    ? Image.network(
        user.photos[i],
        fit: BoxFit.contain,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
      )
    : Image.asset(
        users.photos[i],
        fit: BoxFit.contain,
      ),

                        ),
                      ),
                    ),
                
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
