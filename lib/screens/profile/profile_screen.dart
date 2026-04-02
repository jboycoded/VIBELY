import 'package:flutter/material.dart';

import '../coins/coins_page.dart';
import 'followers_tab_page.dart';
import 'edit_profile_page.dart';
import '../settings/settings_page.dart';
import '../../models/user_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  UserModel user = UserModel(
    name: "Johnson Onoja",
    userID: "ID: 110305",
    age: 23,
    country: "Nigeria",
    bio: "Live streamer | Chill vibes 🎧 | Night streams 🌙",
    imageUrl: "assets/images/streamer1.jpg",
    );

  Future<void> editProfile async {
  final result = await Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => EditProfilePage(
      name: user.name,
      age: user.age,
      country: user.country,
      bio: user.bio,
      imageUrl: user.image,
    ),
  ),
);

if (result != null && mounted) {
  setState(() {
    user.name = result["name"];
    user.age = result["age"];
    user.country = result["country"];
    user.bio = result["bio"];
    user.image = result["image"];
  });
}
                              };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0B1F),

      body: Stack(
        children: [

          /// 🌌 BACKGROUND IMAGE
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// 🌑 DARK OVERLAY
          Container(
            color: Colors.black.withOpacity(0.35),
          ),

          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  /// 🔝 TOP BAR
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.arrow_back, color: Colors.white),

                        Row(
                          children: [
                            /// ✏️ EDIT PROFILE ICON
                            IconButton(
                              onPressed: editProfile,
                              icon: const Icon(Icons.edit, color: Colors.white),
                            ),

                            /// ⚙️ SETTINGS ICON
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.settings, color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// 👤 PROFILE HEADER
                  Column(
                    children: [

                      /// PROFILE IMAGE
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
                                user.imageUrl,
                              ),
                            ),
                          ),

                          /// ❤️ LIKE BUTTON
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

                      /// NAME
const Text(
  user.name,
  style: TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 5),

/// 🌍 AGE + COUNTRY (NEW)
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: const [
    Icon(Icons.cake, size: 14, color: Colors.white70),
    SizedBox(width: 5),
    Text(user.age.toString(), style: TextStyle(color: Colors.white70)),

    SizedBox(width: 10),

    Icon(Icons.location_on, size: 14, color: Colors.white70),
    SizedBox(width: 5),
    Text(user.country, style: TextStyle(color: Colors.white70)),
  ],
),

const SizedBox(height: 5),

/// 🆔 USER ID
const Text(
  user.userID,
  style: TextStyle(color: Colors.white70),
),

                      const SizedBox(height: 10),

                      /// 🧾 BIO (NEW)
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          user.bio,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white60),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// 📊 STATS (CLICKABLE CONTAINERS)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        StatCard(title: "Following", value: "230"),
                        StatCard(title: "Followers", value: "1.2K"),
                        StatCard(title: "Likes", value: "5.6K"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// 💎 LEVEL + VIP
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

                  const SizedBox(height: 20),

                  /// 💰 WALLET CARD (COINS ONLY)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: WalletCard(),
                  ),

                  const SizedBox(height: 25),

                  /// 📂 MENU
                  buildMenuItem(Icons.dashboard, "Creator Center"),
                  buildMenuItem(Icons.emoji_events, "Event Center"),
                  buildMenuItem(Icons.account_balance_wallet, "Wallet"),
                  buildMenuItem(Icons.calendar_today, "Daily Bonus"),
                  buildMenuItem(Icons.inventory, "Inventory"), // renamed
                  

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

/// 📊 CLICKABLE STAT CARD
class StatCard extends StatelessWidget {
  final String title;
  final String value;

  const StatCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// 👉 Handle navigation later
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FollowersPage(),
        ),
      );
      },
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
  gradient: const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF1B1448), // A slightly lighter navy for the "glow"
      Color(0xFF15102E), // Your deep midnight navy
    ],
  ),
  borderRadius: BorderRadius.circular(12),
),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

/// 💎 LEVEL & VIP CARD
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
          Text(title, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

/// 💰 WALLET CARD (COINS)
class WalletCard extends StatelessWidget {
  const WalletCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// 👉 Navigate to coins page later
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CoinsPage(),
        ),
      );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [

            /// COIN ICON
            const Icon(Icons.monetization_on, color: Colors.amber),

            const SizedBox(width: 15),

            /// COIN INFO
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "2460",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Tap to get more coins",
                  style: TextStyle(color: Colors.white60, fontSize: 12),
                ),
              ],
            ),

            const Spacer(),

            const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white54),
          ],
        ),
      ),
    );
  }
}
