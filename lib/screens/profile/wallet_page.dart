import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  int diamonds = 12850;
  double cashEquivalent = 128.50; // Example rate

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0B1F),
      appBar: AppBar(
        title: const Text("Wallet"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [

          /// 🌌 BACKGROUND
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// 🌑 OVERLAY
          Container(color: Colors.black.withOpacity(0.4)),

          /// CONTENT
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [

                  /// 💎 DIAMONDS CARD
                  _buildBalanceCard(),

                  const SizedBox(height: 20),

                  /// 🔄 ACTION BUTTONS
                  Row(
                    children: [
                      Expanded(
                        child: _buildActionButton(
                          "Convert",
                          Icons.swap_horiz,
                          _convertDiamonds,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildActionButton(
                          "Withdraw",
                          Icons.account_balance,
                          _withdraw,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  /// 📜 TRANSACTION HISTORY
                  _buildHistorySection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 💎 BALANCE CARD
  Widget _buildBalanceCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF7B3BFF), Color(0xFFFF4D8D)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Text(
            "Diamonds",
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 10),
          Text(
            diamonds.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "≈ \$${cashEquivalent.toStringAsFixed(2)}",
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  /// 🔘 ACTION BUTTON
  Widget _buildActionButton(
      String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.pinkAccent),
            const SizedBox(height: 5),
            Text(title, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  /// 📜 HISTORY SECTION
  Widget _buildHistorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Transaction History",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        SizedBox(height: 10),

        TransactionTile(
          title: "Gift received",
          amount: "+500 💎",
          date: "Today",
        ),
        TransactionTile(
          title: "Converted to cash",
          amount: "-1000 💎",
          date: "Yesterday",
        ),
      ],
    );
  }

  /// 🔄 CONVERT
  void _convertDiamonds() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Convert Diamonds"),
        content: const Text("Convert diamonds to cash?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                diamonds -= 1000;
                cashEquivalent += 10;
              });
              Navigator.pop(context);
            },
            child: const Text("Confirm"),
          ),
        ],
      ),
    );
  }

  /// 💸 WITHDRAW
  void _withdraw() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Withdrawal coming soon 🚀")),
    );
  }
}

/// 📄 TRANSACTION TILE
class TransactionTile extends StatelessWidget {
  final String title;
  final String amount;
  final String date;

  const TransactionTile({
    super.key,
    required this.title,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.monetization_on, color: Colors.amber),
          const SizedBox(width: 10),
          Expanded(
            child: Text(title, style: const TextStyle(color: Colors.white)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amount, style: const TextStyle(color: Colors.white)),
              Text(date, style: const TextStyle(color: Colors.white54, fontSize: 12)),
            ],
          )
        ],
      ),
    );
  }
}
