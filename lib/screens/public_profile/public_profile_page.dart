import 'package:flutter/material.dart';

import '../../models/live_stream.dart';
import '../../models/user_model.dart';

class PublicProfilePage extends StatefulWidget {
  final LiveStream liveStream;
  
  const PublicProfilePage({
    super.key,
    required this.liveStream,
  });

  @override
  State<PublicProfilePage> createState() => _PublicProfilePageState();
}

class _PublicProfilePageState extends State<PublicProfilePage> {
  // 1. Declare the variable (use 'late' since it's initialized in initState)
  late UserModel user;

  @override
  void initState() {
    super.initState();
    
    // 2. Initialize it here where 'widget' is accessible
    user = UserModel(
      name: widget.liveStream.hostName,
      id: widget.liveStream.id,
      age: 23,
      country: "Nigeria",
      bio: "Live streamer | Chill vibes 🎧 | Night streams 🌙",
      imageUrl: "assets/images/streamer1.jpg",
    );
  }

  @override
  Widget build(BuildContext context) {
    // Now you can use 'user' anywhere in your build method
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
    );
  }
}

  

