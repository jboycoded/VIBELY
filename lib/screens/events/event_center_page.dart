class EventCenterPage extends StatelessWidget {
  const EventCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VibelyBackground(
        child: const Center(
          child: Text(
            "No events yet 🚀",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
