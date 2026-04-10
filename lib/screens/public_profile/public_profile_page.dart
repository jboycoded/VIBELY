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

  UserModel user = UserModel(
    name: widget.liveStream.hostName,
    userID: widget.liveStream.id,
    age: 23,
    country: "Nigeria",
    bio: "Live streamer | Chill vibes 🎧 | Night streams 🌙",
    imageUrl: "assets/images/streamer1.jpg",
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0B1F),

      body: Container(child: Text("Hello the host name is ${user.name}"),),
      );
  }

}

  

