import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0B1F),

      body: Stack(
        children: [

    // BACKGROUND IMAGE
    Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/login_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
    ),

    // DARK OVERLAY (makes text easier to read)
    Container(
      color: Colors.black.withOpacity(0.35),
    ),

      /*
      body: Container(

        /// 🌌 BACKGROUND (Dark Gradient Theme)
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0D0A1F),
              Color(0xFF1A0F3C),
              Color(0xFF2A0D4D),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),*/

      SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [

                /// 🔝 TOP BAR
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.arrow_back, color: Colors.white),
                      Row(
                        children: [
                          Icon(Icons.settings, color: Colors.white),
                          SizedBox(width: 15),
                          Icon(Icons.person_add_alt, color: Colors.white),
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                /// 👤 PROFILE HEADER
                Column(
                  children: [

                    /// Profile Image with Glow
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [

                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF7B3BFF),
                                Color(0xFFFF4D8D),
                              ],
                            ),
                          ),
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                              "assets/images/streamer1.jpg",
                            ),
                          ),
                        ),

                        /// ❤️ Like Button
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.pink,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(Icons.favorite, color: Colors.white, size: 18),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    /// Name
                    const Text(
                      "Johnson Onoja",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    /// ID Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.circle, size: 8, color: Colors.blue),
                        SizedBox(width: 5),
                        Text("11", style: TextStyle(color: Colors.white70)),
                        SizedBox(width: 10),
                        Text("|", style: TextStyle(color: Colors.white38)),
                        SizedBox(width: 10),
                        Icon(Icons.person, size: 16, color: Colors.white70),
                        SizedBox(width: 5),
                        Text("110305", style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// 📊 STATS ROW (Followers, Following, Likes)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      StatItem(title: "Followers", value: "1.2K"),
                      StatItem(title: "Following", value: "230"),
                      StatItem(title: "Likes", value: "5.6K"),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// 💎 LEVEL + VIP CARDS
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: const [
                      Expanded(child: InfoCard(title: "Lv.1", icon: Icons.diamond)),
                      SizedBox(width: 10),
                      Expanded(child: InfoCard(title: "Purchase VIP", icon: Icons.workspace_premium)),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                /// 📂 MENU LIST
                buildMenuItem(Icons.dashboard, "Creator Center"),
                buildMenuItem(Icons.emoji_events, "Event Center"),
                buildMenuItem(Icons.account_balance_wallet, "Wallet"),
                buildMenuItem(Icons.inventory, "Item Bag"),
                buildMenuItem(Icons.post_add, "My Posts"),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    ),
      );
  }

  /// 📂 REUSABLE MENU ITEM
  Widget buildMenuItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.pinkAccent),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white54),
          ],
        ),
      ),
    );
  }
}

/// 📊 STAT ITEM WIDGET (Reusable)
class StatItem extends StatelessWidget {
  final String title;
  final String value;

  const StatItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(color: Colors.white54),
        ),
      ],
    );
  }
}

/// 💎 CARD WIDGET (Level & VIP)
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
          colors: [
            Color(0xFF7B3BFF),
            Color(0xFFFF4D8D),
          ],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
} 
            
