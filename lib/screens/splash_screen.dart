// This allows us to use Timer for delaying navigation
import 'dart:async';

// This imports Flutter's Material Design widgets
import 'package:flutter/material.dart';

// Import the screen we want to navigate to after the splash screen
// You can change this later to LoginScreen or HomeScreen
import 'home_screen.dart';


// SplashScreen is a StatefulWidget because the screen
// needs to perform an action after some time (the timer)
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  // This connects the widget to its mutable state
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


// This class contains the actual logic and UI for the splash screen
class _SplashScreenState extends State<SplashScreen> {

  // initState runs ONLY ONCE when the screen is first created
  @override
  void initState() {
    super.initState();

    // Timer delays an action for a specified time
    Timer(
      const Duration(seconds: 3), // Splash screen stays visible for 3 seconds

      // After the timer finishes, navigate to the next screen
          () => Navigator.pushReplacement(

        // context gives Flutter access to the widget tree
        context,

        // MaterialPageRoute creates a transition to the new screen
        MaterialPageRoute(

          // builder tells Flutter which screen to open
          builder: (context) => const HomeScreenPage(),
        ),
      ),
    );
  }


  // build() describes what the UI looks like
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // Sets the background color of the screen
      // Black fits Vibely's dark theme
      backgroundColor: Colors.black,

      // Center widget places its child in the middle of the screen
      body: Center(

        // Image.asset loads an image from the assets folder
        child: Image.asset(

          // Path to the Vibely logo inside assets
          "assets/images/vibely_logo.png",

          // Controls how large the logo appears
          width: 180,
        ),
      ),
    );
  }
}