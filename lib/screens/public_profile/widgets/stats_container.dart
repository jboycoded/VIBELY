import 'package:flutter/material.dart';
import '../../../models/user_model.dart'; // Replace with your actual file path

class StatsContainer extends StatelessWidget {
  final UserModel user;

  const StatsContainer({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _item("${user.followers}", "Fans"),
          _item("${user.following}", "Following"),
        ],
      ),
    );
  }

  Widget _item(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(color: Colors.white)),
        Text(label,
            style: TextStyle(color: Colors.white.withOpacity(0.6))),
      ],
    );
  }
}
