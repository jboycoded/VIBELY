import 'package:flutter/material.dart';
import '../vibely_background.dart';

class FollowersPage extends StatefulWidget {
  const FollowersPage({super.key});

  @override
  State<FollowersPage> createState() => _FollowersPageState();
}

class _FollowersPageState extends State<FollowersPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  List<Map<String, dynamic>> users = [
    {"name": "Alice", "following": true},
    {"name": "John", "following": false},
    {"name": "Sophia", "following": true},
    {"name": "Daniel", "following": false},
  ];

  String query = "";

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  List<Map<String, dynamic>> filtered() {
    return users
        .where((u) =>
            u["name"].toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VibelyBackground(
        child: SafeArea(
          child: Column(
            children: [

              /// 🔙 HEADER
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon:
                        const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const Text("Connections",
                      style:
                          TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),

              /// 🔍 SEARCH
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  onChanged: (val) =>
                      setState(() => query = val),
                  decoration: InputDecoration(
                    hintText: "Search...",
                    hintStyle:
                        const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.08),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              /// 🔘 TABS
              TabBar(
                controller: controller,
                tabs: const [
                  Tab(text: "Followers"),
                  Tab(text: "Following"),
                  Tab(text: "Likes"),
                ],
              ),

              Expanded(
                child: TabBarView(
                  controller: controller,
                  children: [
                    buildList(),
                    buildList(),
                    buildLikes(),
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
    final list = filtered();

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (_, i) {
        final user = list[i];

        return ListTile(
          title: Text(user["name"],
              style: const TextStyle(color: Colors.white)),
          trailing: ElevatedButton(
            onPressed: () {
              setState(() {
                user["following"] = !user["following"];
              });
            },
            child: Text(
                user["following"] ? "Following" : "Follow"),
          ),
        );
      },
    );
  }

  Widget buildLikes() {
    return const Center(
      child: Text("Liked your profile ❤️",
          style: TextStyle(color: Colors.white)),
    );
  }
}
