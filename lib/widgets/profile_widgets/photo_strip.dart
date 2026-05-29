import 'dart:ui';
import 'package:flutter/material.dart';

import '../../screens/public_profile/full_gallery_screen.dart';

class PhotoStrip extends StatelessWidget {
  final List<String> photos;

  const PhotoStrip({
    super.key,
    required this.photos,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155,
      child: PageView.builder(
        controller: PageController(
          viewportFraction: 0.42,
        ),
        physics: const BouncingScrollPhysics(),
        itemCount: photos.length,
        itemBuilder: (context, index) {

          return TweenAnimationBuilder(
            tween: Tween<double>(
              begin: 0.92,
              end: 1,
            ),
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeOut,
            builder: (context, double value, child) {
              return Transform.scale(
                scale: value,
                child: child,
              );
            },

            child: GestureDetector(
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

                child: Container(
                  margin: const EdgeInsets.only(
                    right: 14,
                  ),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.28),
                        blurRadius: 25,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(28),

                    child: Stack(
                      children: [

                        /// IMAGE
                        Positioned.fill(
                          child: Image.asset(
                            photos[index],
                            fit: BoxFit.cover,
                          ),
                        ),

                        /// DARK OVERLAY
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [

                                  Colors.transparent,

                                  Colors.black.withOpacity(0.12),

                                  Colors.black.withOpacity(0.55),
                                ],
                              ),
                            ),
                          ),
                        ),

                        /// GLASS BORDER
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(28),

                              border: Border.all(
                                color: Colors.white
                                    .withOpacity(0.12),
                                width: 1.2,
                              ),
                            ),
                          ),
                        ),

                        /// BOTTOM INFO
                        /*
                        Positioned(
                          left: 14,
                          right: 14,
                          bottom: 14,

                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,

                            children: [

                              /// PHOTO COUNT
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(30),

                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 15,
                                    sigmaY: 15,
                                  ),

                                  child: Container(
                                    padding:
                                        const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 6,
                                    ),

                                    decoration: BoxDecoration(
                                      color: Colors.white
                                          .withOpacity(0.08),

                                      borderRadius:
                                          BorderRadius.circular(
                                              30),

                                      border: Border.all(
                                        color: Colors.white
                                            .withOpacity(0.08),
                                      ),
                                    ),

                                    child: Row(
                                      children: const [

                                        Icon(
                                          Icons.photo_library_rounded,
                                          color: Colors.white,
                                          size: 14,
                                        ),

                                        SizedBox(width: 6),

                                        Text(
                                          "Gallery",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontWeight:
                                                FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              /// VIEW ICON
                              Container(
                                width: 36,
                                height: 36,

                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,

                                  color: Colors.white
                                      .withOpacity(0.15),

                                  border: Border.all(
                                    color: Colors.white
                                        .withOpacity(0.1),
                                  ),
                                ),

                                child: const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ],
                          ),
                        ),*/
                      ],
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
