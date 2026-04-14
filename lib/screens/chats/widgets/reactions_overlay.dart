import 'package:flutter/material.dart';

class ReactionsOverlay extends StatelessWidget {
  final Map<String, String> reactions;

  const ReactionsOverlay({
    super.key,
    required this.reactions,
  });

  @override
  Widget build(BuildContext context) {
    if (reactions.isEmpty) return const SizedBox();

    return Positioned(
      bottom: -12,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: reactions.values
              .map((e) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Text(e),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
