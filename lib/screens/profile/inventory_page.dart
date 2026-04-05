import 'package:flutter/material.dart';
import '../vibely_background.dart';
import '../../widgets/vibely_design.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage>
    with SingleTickerProviderStateMixin {
  late TabController tab;

  List<Map<String, dynamic>> items = [
    {"name": "VIP Frame", "type": "frame", "active": true},
    {"name": "Fire Frame", "type": "frame", "active": false},
    {"name": "x2 Boost", "type": "boost", "active": false},
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

              vibelyHeader("Inventory"),

              TabBar(
                controller: tab,
                tabs: const [
                  Tab(text: "All"),
                  Tab(text: "Frames"),
                  Tab(text: "Boosts"),
                ],
              ),

              Expanded(
                child: TabBarView(
                  controller: tab,
                  children: [
                    buildGrid(items),
                    buildGrid(items
                        .where((e) => e["type"] == "frame")
                        .toList()),
                    buildGrid(items
                        .where((e) => e["type"] == "boost")
                        .toList()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGrid(List list) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: list.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
      itemBuilder: (_, i) {
        final item = list[i];

        return Container(
          margin: const EdgeInsets.all(8),
          decoration: vibelyGlassBox(
            border: item["active"]
                ? Border.all(color: Colors.pinkAccent)
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, color: Colors.white),
              const SizedBox(height: 10),
              Text(item["name"],
                  style: const TextStyle(color: Colors.white)),
            ],
          ),
        );
      },
    );
  }
}
