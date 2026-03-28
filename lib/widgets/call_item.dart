import 'package:flutter/material.dart';
import '../models/call_model.dart';

class CallItem extends StatelessWidget {
  final CallModel call;

  const CallItem({super.key, required this.call});

  @override
  Widget build(BuildContext context) {

    /// Determine call status icon
    IconData statusIcon;
    Color statusColor;

    switch (call.status) {
      case CallStatus.missed:
        statusIcon = Icons.call_missed;
        statusColor = Colors.red;
        break;
      case CallStatus.incoming:
        statusIcon = Icons.call_received;
        statusColor = Colors.green;
        break;
      case CallStatus.outgoing:
        statusIcon = Icons.call_made;
        statusColor = Colors.blue;
        break;
    }

    /// Determine call type icon
    IconData typeIcon =
        call.type == CallType.video ? Icons.videocam : Icons.call;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      color: Colors.white.withOpacity(0.05),

      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(call.image),
        ),

        title: Text(
          call.name,
          style: const TextStyle(color: Colors.white),
        ),

        subtitle: Row(
          children: [
            Icon(statusIcon, size: 16, color: statusColor),
            const SizedBox(width: 5),
            Text(
              call.time,
              style: const TextStyle(color: Colors.white54),
            ),
          ],
        ),

        trailing: Icon(typeIcon, color: Colors.white),
      ),
    );
  }
}
