class CallItem extends StatelessWidget {
  final CallModel call;

  const CallItem({super.key, required this.call});

  @override
  Widget build(BuildContext context) {
    final user = call.user;

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
      case CallStatus.ongoing:
        statusIcon = Icons.call;
        statusColor = Colors.orange;
        break;
    }

    IconData typeIcon =
        call.type == CallType.video ? Icons.videocam : Icons.call;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      color: Colors.white.withOpacity(0.05),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(user.imageUrl),
        ),
        title: Text(
          user.name,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Row(
          children: [
            Icon(statusIcon, size: 16, color: statusColor),
            const SizedBox(width: 5),
            Text(
              _formatTime(call.time),
              style: const TextStyle(color: Colors.white54),
            ),
          ],
        ),
        trailing: Icon(typeIcon, color: Colors.white),
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);

    if (diff.inMinutes < 60) return "${diff.inMinutes}m ago";
    if (diff.inHours < 24) return "${diff.inHours}h ago";
    return "${time.day}/${time.month}";
  }
}
