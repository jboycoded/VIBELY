import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Stack(
        children: [

          /// BACKGROUND
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// DARK OVERLAY
          Container(
            color: Colors.black.withOpacity(0.5),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:16),

              child: Column(
                children: [

                  /// TOP BAR
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      IconButton(
                        icon: const Icon(Icons.arrow_back,color: Colors.white),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),

                      const Text(
                        "Profile",
                        style: TextStyle(color: Colors.white,fontSize:18),
                      ),

                      const Icon(Icons.notifications_none,color: Colors.white),
                    ],
                  ),

                  const SizedBox(height:20),

                  /// PROFILE IMAGE
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [

                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("assets/images/stream1.jpg"),
                      ),

                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF7B3BFF),
                              Color(0xFFFF4D8D),
                            ],
                          ),
                        ),
                        child: const Icon(Icons.favorite,color: Colors.white,size:16),
                      )

                    ],
                  ),

                  const SizedBox(height:12),

                  /// NAME
                  const Text(
                    "Rick, 25",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize:18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height:4),

                  /// ID / STATUS
                  const Text(
                    "ID 110305",
                    style: TextStyle(color: Colors.white54),
                  ),

                  const SizedBox(height:12),

                  /// BIO
                  const Text(
                    "Hi there! I love gaming, traveling, and meeting new people. Let’s connect.",
                    style: TextStyle(color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height:12),

                  const Text(
                    "10 min away",
                    style: TextStyle(color: Colors.white54),
                  ),

                  const SizedBox(height:20),

                  /// STATS ROW
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [

                      StatCard(title: "572K", subtitle: "Followers"),
                      StatCard(title: "16.7K", subtitle: "Likes"),

                    ],
                  ),

                  const SizedBox(height:16),

                  /// WALLET
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal:16,vertical:14),

                    decoration: BoxDecoration(
                      color: const Color(0xFF1B1534),
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [

                        Row(
                          children: [
                            Icon(Icons.account_balance_wallet,color: Colors.white),
                            SizedBox(width:10),
                            Text("My Wallet",style: TextStyle(color: Colors.white)),
                          ],
                        ),

                        Row(
                          children: [
                            Icon(Icons.monetization_on,color: Colors.orange),
                            SizedBox(width:4),
                            Text("1,200",style: TextStyle(color: Colors.white)),
                          ],
                        )

                      ],
                    ),
                  ),

                  const SizedBox(height:20),

                  /// MENU ROW
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [

                      MenuItem(icon: Icons.workspace_premium, label: "VIP"),
                      MenuItem(icon: Icons.favorite, label: "Moments"),
                      MenuItem(icon: Icons.star, label: "Gifts"),
                      MenuItem(icon: Icons.settings, label: "Settings"),

                    ],
                  ),

                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}



class StatCard extends StatelessWidget {

  final String title;
  final String subtitle;

  const StatCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 150,
      padding: const EdgeInsets.symmetric(vertical:14),

      decoration: BoxDecoration(
        color: const Color(0xFF1B1534),
        borderRadius: BorderRadius.circular(15),
      ),

      child: Column(
        children: [

          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height:4),

          Text(
            subtitle,
            style: const TextStyle(color: Colors.white54),
          ),

        ],
      ),
    );
  }
}



class MenuItem extends StatelessWidget {

  final IconData icon;
  final String label;

  const MenuItem({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Container(
          padding: const EdgeInsets.all(12),

          decoration: BoxDecoration(
            color: const Color(0xFF1B1534),
            shape: BoxShape.circle,
          ),

          child: Icon(icon,color: Colors.white),
        ),

        const SizedBox(height:6),

        Text(
          label,
          style: const TextStyle(color: Colors.white54,fontSize:12),
        )

      ],
    );
  }
}
