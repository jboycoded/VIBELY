import 'package:flutter/material.dart';
import '../vibely_background.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Map<String, dynamic>> items = [
    {"name": "VIP Frame", "type": "frame", "active": true},
    {"name": "Fire Frame", "type": "frame", "active": false},
    {"name": "x2 Boost", "type": "boost", "active": false},
    {"name": "Golden Badge", "type": "badge", "active": true},
  ];

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  void equipItem(int index) {
    final type = items[index]["type"];

    setState(() {
      /// only one active per type
      for (var item in items) {
        if (item["type"] == type) item["active"] = false;
      }
      items[index]["active"] = true;
    });
  }

  void showItemActions(int index) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      builder: (_) {
        final item = items[index];

        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(item["name"],
                  style: const TextStyle(color: Colors.white, fontSize: 18)),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  equipItem(index);
                },
                child: const Text("Equip"),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() => items[index]["active"] = false);
                },
                child: const Text("Remove"),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Map<String, dynamic>> filterItems(int tab) {
    switch (tab) {
      case 1:
        return items.where((e) => e["active"]).toList();
      case 2:
        return items.where((e) => e["type"] == "frame").toList();
      case 3:
        return items.where((e) => e["type"] == "boost").toList();
      default:
        return items;
    }
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
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const Text("Inventory",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),

              /// 🔘 TABS
              TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: "All"),
                  Tab(text: "Active"),
                  Tab(text: "Frames"),
                  Tab(text: "Boosts"),
                ],
              ),

              /// 📦 GRID
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: List.generate(4, (tabIndex) {
                    final filtered = filterItems(tabIndex);

                    return GridView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: filtered.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (_, i) {
                        final item = filtered[i];

                        return GestureDetector(
                          onTap: () => showItemActions(
                              items.indexOf(item)),
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(18),
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
                                    style: const TextStyle(
                                        color: Colors.white)),
                                const SizedBox(height: 5),
                                Text(
                                  item["active"]
                                      ? "Active"
                                      : item["type"],
                                  style: const TextStyle(
                                      color: Colors.white54,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
