import 'package:flutter/material.dart';

import '../vibely_background.dart';

class FollowersPage extends StatefulWidget {
  const FollowersPage({super.key});

  @override
  State<FollowersPage> createState() => _FollowersPageState();
}

class _FollowersPageState extends State<FollowersPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final users = [
    {"name": "Jessica", "followers": "5.2K", "following": false},
    {"name": "Alex", "followers": "3.1K", "following": true},
    {"name": "Lena", "followers": "2.1K", "following": false},
  ];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: vibelyBackground(
        child: SafeArea(
          child: Column(
            children: [
              // 🔙 Header
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: const [
                    Icon(Icons.arrow_back, color: Colors.white),
                    SizedBox(width: 12),
                    Text(
                      "Connections",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              // 🔘 Tabs
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      tabButton("Followers", 0),
                      tabButton("Following", 1),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // 🔍 Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Search...",
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                      icon: Icon(Icons.search, color: Colors.white54),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // 📋 List
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: users.length,
                  itemBuilder: (_, index) {
                    final user = users[index];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage(
                                "assets/images/streamer1.jpg",
                              ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user["name"] as String,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${user["followers"]} followers",
                                  style: const TextStyle(
                                      color: Colors.white54),
                                ),
                              ],
                            ),
                          ),

                          // 🔥 Gradient Button
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 8),
                            decoration: BoxDecoration(
                              gradient: user["following"] as bool
                                  ? null
                                  : const LinearGradient(
                                      colors: [
                                        Colors.pinkAccent,
                                        Colors.purple
                                      ],
                                    ),
                              color: user["following"] as bool
                                  ? Colors.white24
                                  : null,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              user["following"] as bool
                                  ? "Following"
                                  : "Follow",
                              style:
                                  const TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget tabButton(String text, int index) {
    final isActive = _tabController.index == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => _tabController.index = index);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            gradient: isActive
                ? const LinearGradient(
                    colors: [Colors.pinkAccent, Colors.purple])
                : null,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Text(text,
              style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
