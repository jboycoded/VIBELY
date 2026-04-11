import 'package:flutter/material.dart';
import '../../models/message_model.dart';
import '../../models/conversation_model.dart';
import '../../widgets/chat_bubble.dart';
import '../../widgets/chat_app_bar.dart';
import '../../widgets/chat_input_bar.dart';
import '../../widgets/typing_indicator.dart';

class PrivateChatScreen extends StatefulWidget {
  final ConversationModel conversation;

  const PrivateChatScreen({super.key, required this.conversation});

  @override
  State<PrivateChatScreen> createState() => _PrivateChatScreenState();
}

class _PrivateChatScreenState extends State<PrivateChatScreen> {

  final TextEditingController controller = TextEditingController();

  List<MessageModel> messages = [];
  bool isTyping = false;

  @override
  void initState() {
    super.initState();

    messages = [
      MessageModel(
        id: "1",
        senderId: widget.conversation.user.id,
        text: "Hey 👋",
        timestamp: DateTime.now(),
      ),
    ];

    /// simulate seen
    Future.delayed(const Duration(seconds: 1), markAllSeen);
  }

  void markAllSeen() {
    setState(() {
      messages = messages.map((m) {
        if (m.senderId == "me") {
          return m.copyWith(status: MessageStatus.seen);
        }
        return m;
      }).toList();
    });
  }

  void sendMessage() {
    if (controller.text.trim().isEmpty) return;

    final msg = MessageModel(
      id: DateTime.now().toString(),
      senderId: "me",
      text: controller.text,
      timestamp: DateTime.now(),
      status: MessageStatus.sending,
    );

    setState(() {
      messages.insert(0, msg);
      isTyping = true;
    });

    controller.clear();

    /// simulate delivery
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        messages[0] =
            messages[0].copyWith(status: MessageStatus.delivered);
      });
    });

    /// simulate reply
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isTyping = false;
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

  /// IMAGE MESSAGE MOCK
  void sendImage() {
    setState(() {
      messages.insert(
        0,
        MessageModel(
          id: DateTime.now().toString(),
          senderId: "me",
          text: "",
          type: MessageType.image,
          mediaUrl: "assets/images/stream1.jpg",
          timestamp: DateTime.now(),
        ),
      );
    });
  }

  /// VOICE MESSAGE MOCK
  void sendVoice() {
    setState(() {
      messages.insert(
        0,
        MessageModel(
          id: DateTime.now().toString(),
          senderId: "me",
          text: "",
          type: MessageType.voice,
          voiceDuration: const Duration(seconds: 8),
          timestamp: DateTime.now(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.conversation.user;

    return Scaffold(
      body: Stack(
        children: [

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

                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.all(12),
                    itemCount: messages.length + (isTyping ? 1 : 0),
                    itemBuilder: (_, i) {
                      if (isTyping && i == 0) {
                        return const TypingIndicator();
                      }

                      final msg =
                          messages[isTyping ? i - 1 : i];

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
                  onImage: sendImage,
                  onVoice: sendVoice,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
