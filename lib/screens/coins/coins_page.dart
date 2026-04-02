import 'package:flutter/material.dart';
import '../vibely_background.dart';

class CoinsPage extends StatefulWidget {
  const CoinsPage({super.key});

  @override
  State<CoinsPage> createState() => _CoinsPageState();
}

class _CoinsPageState extends State<CoinsPage> {
  int coins = 2460;

  int selectedTab = 0; // 0 = TopUp, 1 = History

  List<Map<String, String>> transactions = [
    {"title": "Purchased Coins", "amount": "+1000", "date": "Today"},
    {"title": "Sent Gift", "amount": "-200", "date": "Yesterday"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VibelyBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                /// 🔝 HEADER
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Coins",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// 💰 BALANCE CARD
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFF4D8D), Color(0xFF7B3BFF)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Your Balance",
                        style: TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        coins.toString(),
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// 🔘 TAB SWITCHER
                Row(
                  children: [
                    _buildTab("Top Up", 0),
                    _buildTab("History", 1),
                  ],
                ),

                const SizedBox(height: 15),

                /// 📦 CONTENT
                Expanded(
                  child: selectedTab == 0
                      ? _buildTopUp()
                      : _buildHistory(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 🔘 TAB BUTTON
  Widget _buildTab(String title, int index) {
    bool isActive = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => selectedTab = index);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isActive
                ? Colors.pinkAccent.withOpacity(0.2)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isActive ? Colors.pinkAccent : Colors.white70,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 💳 TOP UP SECTION
  Widget _buildTopUp() {
    return ListView(
      children: [
        coinTile("100 Coins", "₦500", 100),
        coinTile("500 Coins", "₦2000", 500),
        coinTile("1000 Coins", "₦3500", 1000, best: true),
        coinTile("5000 Coins", "₦15000", 5000),
      ],
    );
  }

  /// 📜 HISTORY SECTION
  Widget _buildHistory() {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final tx = transactions[index];

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              const Icon(Icons.monetization_on, color: Colors.amber),
              const SizedBox(width: 10),

              Expanded(
                child: Text(
                  tx["title"]!,
                  style: const TextStyle(color: Colors.white),
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    tx["amount"]!,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    tx["date"]!,
                    style: const TextStyle(
                        color: Colors.white54, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  /// 🪙 COIN TILE
  Widget coinTile(String title, String price, int value,
      {bool best = false}) {
    return GestureDetector(
      onTap: () => _purchaseCoins(value, price),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16),
          border: best
              ? Border.all(color: Colors.pinkAccent, width: 1.5)
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: const TextStyle(color: Colors.white)),

            Row(
              children: [
                if (best)
                  const Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Text(
                      "Best",
                      style: TextStyle(
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                Text(price,
                    style: const TextStyle(color: Colors.white)),
              ],
            )
          ],
        ),
      ),
    );
  }

  /// 💳 PURCHASE LOGIC
  void _purchaseCoins(int amount, String price) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Confirm Purchase"),
        content: Text("Buy $amount coins for $price?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                coins += amount;

                transactions.insert(0, {
                  "title": "Purchased Coins",
                  "amount": "+$amount",
                  "date": "Now",
                });
              });

              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Successfully purchased $amount coins 🎉"),
                ),
              );
            },
            child: const Text("Confirm"),
          ),
        ],
      ),
    );
  }
}
