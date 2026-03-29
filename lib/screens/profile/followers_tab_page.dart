import 'package:flutter/material.dart';

class FollowersTabPage extends StatefulWidget {
  const FollowersTabPage({super.key});

  @override
  State<FollowersTabPage> createState() => _FollowersTabPageState();
}

class _FollowersTabPageState extends State<FollowersTabPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final followers = List.generate(10, (i) => "Follower $i");
  final following = List.generate(10, (i) => "Following $i");

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  Widget buildTab(String text, bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        gradient: isActive
            ? const LinearGradient(
                colors: [Colors.pinkAccent, Colors.orangeAccent],
              )
            : null,
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(title: const Text("Connections")),
      body: Column(
        children: [
          const SizedBox(height: 10),

          // Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _tabController.animateTo(0),
                    child: AnimatedBuilder(
                      animation: _tabController,
                      builder: (_, __) =>
                          buildTab("Followers", _tabController.index == 0),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _tabController.animateTo(1),
                    child: AnimatedBuilder(
                      animation: _tabController,
                      builder: (_, __) =>
                          buildTab("Following", _tabController.index == 1),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
  margin: const EdgeInsets.symmetric(horizontal: 16),
  padding: const EdgeInsets.symmetric(horizontal: 12),
  decoration: BoxDecoration(
    color: const Color(0xFF1A1A1A),
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
)

          // Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                buildList(followers),
                buildList(following),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildList(List<String> users) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: users.length,
      itemBuilder: (_, i) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              const CircleAvatar(radius: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  users[i],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.pinkAccent, Colors.orangeAccent],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text("Follow"),
              )
            ],
          ),
        );
      },
    );
  }
}
