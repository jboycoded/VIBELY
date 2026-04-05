import 'package:flutter/material.dart';

/// 🔙 HEADER
Widget vibelyHeader(BuildContext context, String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

/// 🧊 GLASS CONTAINER
BoxDecoration vibelyGlassBox({Border? border}) {
  return BoxDecoration(
    color: Colors.white.withOpacity(0.08),
    borderRadius: BorderRadius.circular(16),
    border: border,
  );
}

/// 🎨 GRADIENT BUTTON
Widget vibelyGradientButton(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [Color(0xFFFF4D8D), Color(0xFF7B3BFF)],
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
  );
}
