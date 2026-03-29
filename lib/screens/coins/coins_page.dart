import 'package:flutter/material.dart';

// Reusable Coin Card Widget
class CoinCard extends StatelessWidget {
  final String coinName;
  final int amount;
  final Color color;

  const CoinCard({
    super.key,
    required this.coinName,
    required this.amount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            coinName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.monetization_on,
                color: color,
              ),
              const SizedBox(width: 8),
              Text(
                '$amount',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Main Coins Page
class CoinsPage extends StatelessWidget {
  const CoinsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Example coin data
    final coins = [
      {'name': 'Gold Coins', 'amount': 1200, 'color': Colors.amber},
      {'name': 'Silver Coins', 'amount': 500, 'color': Colors.grey},
      {'name': 'Gems', 'amount': 50, 'color': Colors.purple},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Coins'),
        backgroundColor: Colors.pinkAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Total coins summary
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.pinkAccent, Colors.orangeAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: const [
                  Text(
                    'Total Coins',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '1,750',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Coins list
            Expanded(
              child: ListView.separated(
                itemCount: coins.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final coin = coins[index];
                  return CoinCard(
                    coinName: coin['name'] as String,
                    amount: coin['amount'] as int,
                    color: coin['color'] as Color,
                  );
                },
              ),
            ),
            // Action button
            ElevatedButton(
              onPressed: () {
                // TODO: Add coin purchase or redeem action
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: Colors.pinkAccent,
              ),
              child: const Text(
                'Get More Coins',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
