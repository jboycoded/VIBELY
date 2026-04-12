import 'package:flutter/material.dart';

// Replace 'your_app_name' with your actual project name
import '../../../models/call_model.dart';
import 'call_item.dart'; // Or wherever CallItem is saved


class CallList extends StatelessWidget {
  final List<CallModel> calls;

  const CallList({super.key, required this.calls});

  @override
  Widget build(BuildContext context) {
    if (calls.isEmpty) {
      return const Center(
        child: Text("No calls yet", style: TextStyle(color: Colors.white54)),
      );
    }

    return ListView.builder(
      itemCount: calls.length,
      itemBuilder: (_, i) => CallItem(call: calls[i]),
    );
  }
}
