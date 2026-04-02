import 'package:flutter/material.dart';
import '../vibely_background.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  List<Map<String, dynamic>> items = [
    {"name": "VIP Frame", "type": "frame", "active": false},
    {"name": "x2 Gift Boost", "type": "boost", "active": false},
    {"name": "Golden Badge", "type": "badge", "active": true},
  ];

  void toggleItem(int index) {
    setState(() {
      items[index]["active"] = !items[index]["active"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VibelyBackground(
        child: GridView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: items.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
          itemBuilder: (_, i) {
            final item = items[i];

            return GestureDetector(
              onTap: () => toggleItem(i),
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: item["active"]
                      ? Colors.pinkAccent.withOpacity(0.3)
                      : Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.inventory, color: Colors.white),
                    const SizedBox(height: 10),
                    Text(item["name"],
                        style:
                            const TextStyle(color: Colors.white)),
                    const SizedBox(height: 5),
                    Text(
                      item["active"] ? "Equipped" : "Tap to Equip",
                      style: const TextStyle(
                          color: Colors.white54, fontSize: 12),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
