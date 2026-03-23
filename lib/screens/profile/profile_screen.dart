import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0A1F), // Matches your HomeScreen
      body: Stack(
        children: [
          // 1. Background Vibe (Purple Glow)
          Positioned(
            top: -100,
            right: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF7B3BFF).withOpacity(0.15),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF7B3BFF).withOpacity(0.2),
                    blurRadius: 100,
                    spreadRadius: 50,
                  ),
                ],
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  _buildTopBar(),
                  const SizedBox(height: 20),
                  _buildProfileAvatar(),
                  const SizedBox(height: 10),
                  _buildUsername(),
                  const SizedBox(height: 8),
                  _buildStatsRow(),
                  const SizedBox(height: 25),
                  _buildActionCards(),
                  const SizedBox(height: 20),
                  _buildMenuSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
        Row(
          children: const [
            Icon(Icons.settings_outlined, color: Colors.white, size: 24),
            SizedBox(width: 15),
            Icon(Icons.person_add_outlined, color: Colors.white, size: 24),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileAvatar() {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF7B3BFF), Color(0xFFFF4D8D)],
              ),
            ),
            child: const CircleAvatar(
              radius: 55,
              backgroundImage: NetworkImage('https://via.placeholder.com'), // Replace with user image
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: Color(0xFFFF4D8D),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.favorite, color: Colors.white, size: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildUsername() {
    return const Text(
      "Johnson Onoja",
      style: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _statItem(Icons.circle, "0", Colors.blue),
        const SizedBox(width: 15),
        _statItem(Icons.person_outline, "110305", Colors.white70),
        const SizedBox(width: 15),
        const Icon(Icons.crop_square, color: Colors.white54, size: 18),
      ],
    );
  }

  Widget _statItem(IconData icon, String label, Color iconColor) {
    return Row(
      children:,
    );
  }

  Widget _buildActionCards() {
    return Row(
      children: [
        Expanded(
          child: _actionCard(
            gradient: const [Color(0xFF2A1B5E), Color(0xFF3B1E7E)],
            icon: Icons.diamond,
            iconColor: Colors.cyanAccent,
            title: "Lv.1",
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: _actionCard(
            gradient: const [Color(0xFF5E441B), Color(0xFF3E2C11)],
            icon: Icons.verified_user,
            iconColor: Colors.orangeAccent,
            title: "Purchase VIP",
          ),
        ),
      ],
    );
  }

  Widget _actionCard({required List<Color> gradient, required IconData icon, required Color iconColor, required String title}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: gradient),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:,
      ),
    );
  }

  Widget _buildMenuSection() {
    return Column(
      children: [
        _menuTile(Icons.chat_bubble_outline, "Creator Center", Colors.cyan),
        _menuTile(Icons.emoji_events_outlined, "Event Center", Colors.orange, value: "1,200"),
        _menuTile(Icons.account_balance_wallet_outlined, "Wallet", Colors.pinkAccent),
        _menuTile(Icons.inventory_2_outlined, "Item Bag", Colors.amber),
        _menuTile(Icons.grid_view_outlined, "My Posts", Colors.purpleAccent),
      ],
    );
  }

  Widget _menuTile(IconData icon, String title, Color color, {String? value}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF15102E).withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children:,
            const Icon(Icons.arrow_forward_ios, color: Colors.white24, size: 14),
          ],
        ),
      ),
    );
  }
}
