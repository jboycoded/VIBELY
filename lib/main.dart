import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';

void main() {
  runApp(const VibelyApp());
}

class VibelyApp extends StatelessWidget {
  const VibelyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vibely',
      home: SplashScreen(),
    );
  }
}