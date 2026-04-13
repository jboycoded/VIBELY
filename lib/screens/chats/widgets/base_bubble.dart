// base_bubble.dart

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BaseBubble extends StatelessWidget {
  final Widget child;
  final bool isMe;
  final DateTime timestamp;
  final bool seen;
  final bool isFirstInGroup;
  final bool isLastInGroup;

  const BaseBubble({
    super.key,
    required this.child,
    required this.isMe,
    required this.timestamp,
    required this.seen,
    required this.isFirstInGroup,
    required this.isLastInGroup,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: isFirstInGroup ? 10 : 2,
        bottom: isLastInGroup ? 10 : 2,
        left: 10,
        right: 10,
      ),
      child: Align(
        alignment:
            isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(18),
                    topRight: const Radius.circular(18),
                    bottomLeft: Radius.circular(isMe ? 18 : 4),
                    bottomRight: Radius.circular(isMe ? 4 : 18),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth:
                            MediaQuery.of(context).size.width * 0.7,
                      ),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isMe
                            ? Colors.purple.withOpacity(0.6)
                            : Colors.white.withOpacity(0.1),
                      ),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.end,
                        children: [
                          child,
                          const SizedBox(height: 4),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                DateFormat('h:mm a')
                                    .format(timestamp),
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.white54,
                                ),
                              ),
                              const SizedBox(width: 4),
                              if (isMe)
                                Icon(
                                  seen
                                      ? Icons.done_all
                                      : Icons.check,
                                  size: 12,
                                  color: seen
                                      ? Colors.blue
                                      : Colors.white54,
                                ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                /// 🟣 Bubble Tail
                Positioned(
                  bottom: 0,
                  left: isMe ? null : -2,
                  right: isMe ? -2 : null,
                  child: CustomPaint(
                    painter: BubbleTail(isMe),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BubbleTail extends CustomPainter {
  final bool isMe;

  BubbleTail(this.isMe);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isMe
          ? Colors.purple.withOpacity(0.6)
          : Colors.white.withOpacity(0.1);

    final path = Path();

    if (isMe) {
      path.moveTo(0, 0);
      path.lineTo(10, 0);
      path.lineTo(10, 10);
    } else {
      path.moveTo(10, 0);
      path.lineTo(0, 0);
      path.lineTo(0, 10);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
