import 'dart:ui';
import 'package:flutter/material.dart';

class AboutMeSection extends StatelessWidget {
  final String bio;

  const AboutMeSection({
    super.key,
    required this.bio,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),

        /*child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 20,
            sigmaY: 20,
          ),*/

          child: Container(
            padding: const EdgeInsets.all(22),

            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),

              borderRadius: BorderRadius.circular(30),

              border: Border.all(
                color: Colors.white.withOpacity(0.05),
              ),

              /*boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.18),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],*/
            ),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                /// HEADER
                Row(
                  children: [

                    Container(
                      width: 42,
                      height: 42,

                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFFFF4D8D)
                                .withOpacity(0.85),

                            const Color(0xFF9B4DFF)
                                .withOpacity(0.85),
                          ],
                        ),

                        borderRadius:
                            BorderRadius.circular(14),
                      ),

                      child: const Icon(
                        Icons.auto_awesome_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),

                    const SizedBox(width: 14),

                    const Text(
                      "About Me",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// BIO
                Text(
                  bio,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.72),
                    fontSize: 15,
                    height: 1.8,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        //),
      ),
    );
  }
}
