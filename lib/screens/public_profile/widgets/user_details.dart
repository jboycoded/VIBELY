import 'package:flutter/material.dart';
import '../../../models/user_model.dart'; // Replace with your actual file path

class UserDetails extends StatelessWidget {
  final UserModel user;

  const UserDetails({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(user.name,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),

        const SizedBox(height: 6),

        Text(
          "${user.age} • ${user.gender} • ${user.location}",
          style: TextStyle(color: Colors.white.withOpacity(0.7)),
        ),

        const SizedBox(height: 4),

        Text("ID: ${user.id}",
            style: TextStyle(color: Colors.white.withOpacity(0.5))),
      ],
    );
  }
}
