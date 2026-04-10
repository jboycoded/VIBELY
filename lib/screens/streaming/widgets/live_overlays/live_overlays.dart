import 'dart:ui';
import 'package:flutter/material.dart';

class LiveOverlays {
  static Widget noInternet() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(color: Colors.black54),
    );
  }

  static Widget loading() {
    return const Center(child: CircularProgressIndicator());
  }

  static Widget ended(VoidCallback onExit) {
    return Center(
      child: ElevatedButton(
        onPressed: onExit,
        child: const Text("Exit"),
      ),
    );
  }
}
