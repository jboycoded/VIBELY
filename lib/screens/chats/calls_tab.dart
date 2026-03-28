import 'package:flutter/material.dart';

import '../../models/call_model.dart';
import '../../widgets/call_item.dart';

class CallsTab extends StatelessWidget {
  final List<CallModel> calls;

  const CallsTab({super.key, required this.calls});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: calls.map((call) => CallItem(call: call)).toList(),
    );
  }
}
