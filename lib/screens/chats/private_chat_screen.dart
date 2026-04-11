class PrivateChatScreen extends StatefulWidget {
  final ConversationModel conversation;

  const PrivateChatScreen({
    super.key,
    required this.conversation,
  });

  @override
  State<PrivateChatScreen> createState() => _PrivateChatScreenState();
}

class _PrivateChatScreenState extends State<PrivateChatScreen> {

  final TextEditingController controller = TextEditingController();

  List<MessageModel> messages = [];

  @override
  void initState() {
    super.initState();

    /// 🧪 MOCK INITIAL MESSAGES
    messages = [
      MessageModel(
        id: "1",
        senderId: "me",
        text: "Hey, how’s your night going?",
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      MessageModel(
        id: "2",
        senderId: widget.conversation.user.id,
        text: "Pretty good! Just chilling 😌",
        timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
      ),
    ];
  }

  void sendMessage() {
    if (controller.text.trim().isEmpty) return;

    final newMessage = MessageModel(
      id: DateTime.now().toString(),
      senderId: "me",
      text: controller.text,
      timestamp: DateTime.now(),
    );

    setState(() {
      messages.insert(0, newMessage);
    });

    controller.clear();

    /// 🧪 FAKE REPLY
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        messages.insert(
          0,
          MessageModel(
            id: DateTime.now().toString(),
            senderId: widget.conversation.user.id,
            text: "Nice 😏",
            timestamp: DateTime.now(),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.conversation.user;

    return Scaffold(
      body: Stack(
        children: [

          /// BACKGROUND
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(color: Colors.black.withOpacity(0.35)),

          SafeArea(
            child: Column(
              children: [

                ChatAppBar(user: user),

                /// 💬 MESSAGES
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.all(12),
                    itemCount: messages.length,
                    itemBuilder: (_, i) {
                      final msg = messages[i];

                      return ChatBubble(
                        message: msg,
                        isMe: msg.senderId == "me",
                      );
                    },
                  ),
                ),

                ChatInputBar(
                  controller: controller,
                  onSend: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
