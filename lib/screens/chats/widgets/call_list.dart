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
