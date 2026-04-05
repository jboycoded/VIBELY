import 'package:flutter/material.dart';
import '../vibely_background.dart';

class FollowersPage extends StatefulWidget {
  const FollowersPage({super.key});

  @override
  State<FollowersPage> createState() => _FollowersPageState();
}

class _FollowersPageState extends State<FollowersPage>
    with SingleTickerProviderStateMixin {
  late TabController tab;

  List<Map<String, dynamic>> users = [
    {"name": "Alice", "following": true},
    {"name": "John", "following": false},
  ];

  @override
  void initState() {
    tab = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: VibelyBackground(
        child: SafeArea(
          child: Column(
            children: [

              header("Connections"),

              TabBar(
                controller: tab,
                tabs: const [
                  Tab(text: "Followers"),
                  Tab(text: "Following"),
                  Tab(text: "Likes"),
                ],
              ),

              Expanded(
                child: TabBarView(
                  controller: tab,
                  children: [
                    buildList(),
                    buildList(),
                    const Center(
                      child: Text("No Likes Yet",
                          style: TextStyle(color: Colors.white)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: users.length,
      itemBuilder: (_, i) {
        final user = users[i];

        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(12),
          decoration: glassBox(),
          child: Row(
            children: [
              Text(user["name"],
                  style: const TextStyle(color: Colors.white)),
              const Spacer(),
              gradientButton(user["following"] ? "Following" : "Follow")
            ],
          ),
        );
      },
    );
  }
}
