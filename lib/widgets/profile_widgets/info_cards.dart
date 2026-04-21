import 'package:flutter/material.dart';

class InfoCards extends StatelessWidget {
  const InfoCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: const [
          Expanded(child: InfoCard(title: "Lv.1", icon: Icons.diamond)),
          SizedBox(width: 10),
          Expanded(child: InfoCard(title: "VIP", icon: Icons.workspace_premium)),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const InfoCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF7B3BFF), Color(0xFFFF4D8D)],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
