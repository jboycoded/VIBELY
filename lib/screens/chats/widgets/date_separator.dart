// date_separator.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSeparator extends StatelessWidget {
  final DateTime date;

  const DateSeparator({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          DateFormat('MMM d, yyyy').format(date),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
