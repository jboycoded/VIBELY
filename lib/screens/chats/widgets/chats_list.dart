class ChatsList extends StatelessWidget {
  final List<ConversationModel> conversations;
  final Function(ConversationModel) onTap;

  const ChatsList({
    super.key,
    required this.conversations,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (conversations.isEmpty) {
      return const Center(
        child: Text("No chats yet", style: TextStyle(color: Colors.white54)),
      );
    }

    return ListView.builder(
      itemCount: conversations.length,
      itemBuilder: (_, i) {
        final convo = conversations[i];

        return ChatItem(
          conversation: convo,
          onTap: () => onTap(convo),
        );
      },
    );
  }
}
