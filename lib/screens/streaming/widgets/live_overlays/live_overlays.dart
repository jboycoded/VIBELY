import 'dart:ui';
import 'package:flutter/material.dart';

class LiveOverlays {
  static Widget noInternet() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        color: Colors.black.withOpacity(0.6),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.wifi_off, color: Colors.white, size: 40),
                SizedBox(height: 10),
                Text(
                  "No Internet Connection",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: 6),
                Text(
                  "Reconnecting...",
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget loading() {
    return Container(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 12),
            Text(
              "Joining live...",
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  static Widget ended(VoidCallback onExit) {
    return Container(
      color: Colors.black.withOpacity(0.85),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Live Ended",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Exit"),
            )
          ],
        ),
      ),
    );
  }
}
