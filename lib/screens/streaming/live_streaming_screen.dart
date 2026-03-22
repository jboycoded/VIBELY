import 'package:flutter/material.dart';

class LiveStreamingScreen extends StatelessWidget {
  const LiveStreamingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.black,

      body: const Center(
        child: Text(
          "LIVE STREAM STARTED 🎥",
          style: TextStyle(color: Colors.white,fontSize:20),
        ),
      ),

    );
  }
}
