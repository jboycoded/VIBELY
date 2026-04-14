// private_chat_screen.dart

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../services/audio_service.dart';
import '../../services/media_service.dart';

import '../../models/message_model.dart';
import '../../models/conversation_model.dart';

import 'widgets/chat_bubble.dart';
import 'widgets/chat_app_bar.dart';
import 'widgets/chat_input_bar.dart';
import 'widgets/typing_indicator.dart';
import 'widgets/date_separator.dart';

class PrivateChatScreen extends StatefulWidget {
  final ConversationModel conversation;

  const PrivateChatScreen({super.key, required this.conversation});

  @override
  State<PrivateChatScreen> createState() => _PrivateChatScreenState();
}

class _PrivateChatScreenState extends State<PrivateChatScreen> {
  final audioService = AudioService();
  final mediaService = MediaService();

  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  List<MessageModel> messages = [];
  MessageModel? replyingTo;
  bool isTyping = false;

  bool isRecording = false;
  DateTime? recordStart;

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

      /// 🔁 REPLY DATA
      replyText: replyingTo?.text,
      replyToMessageId: replyingTo?.id,
      replySenderId: replyingTo?.senderId,
    );

    setState(() {
      messages.add(msg); // ✅ FIXED
      replyingTo = null; // ✅ IMPORTANT
      isTyping = true;
    });
    scrollToBottom();

    controller.clear();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        messages.last =
            messages.last.copyWith(status: MessageStatus.delivered);
      });
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isTyping = false;
        messages.add(
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

  void scrollToBottom() {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!scrollController.hasClients) return;

    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  });
  }

  /// 🎤 START RECORD
  Future<void> startRecording() async {
    if (!await audioService.hasPermission()) return;

    final directory = await getTemporaryDirectory();
    final path =
        "${directory.path}/${DateTime.now().millisecondsSinceEpoch}.m4a";

    await audioService.startRecording(path);

    setState(() {
      isRecording = true;
      recordStart = DateTime.now();
    });
  }

  /// 🎤 STOP RECORD
  Future<void> stopRecording() async {
    final path = await audioService.stopRecording();
    if (path == null) return;

    final duration = DateTime.now().difference(recordStart!);

    setState(() {
      isRecording = false;

      messages.add( // ✅ FIXED
        MessageModel(
          id: DateTime.now().toString(),
          senderId: "me",
          text: "",
          type: MessageType.voice,
          mediaUrl: path,
          voiceDuration: duration,
          timestamp: DateTime.now(),
        ),
      );
    });
    scrollToBottom();
  }

  /// 📷 IMAGE
  Future<void> sendImage() async {
    final path = await mediaService.pickImage();
    if (path == null) return;

    setState(() {
      messages.add( // ✅ FIXED
        MessageModel(
          id: DateTime.now().toString(),
          senderId: "me",
          text: "",
          type: MessageType.image,
          mediaUrl: path,
          timestamp: DateTime.now(),
        ),
      );
    });
    scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.conversation.user;

    return Scaffold(
      body: Stack(
        children: [

          /// 🌌 BACKGROUND
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

                /// 💬 CHAT LIST (UPDATED)
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    itemCount:
                        messages.length + (isTyping ? 1 : 0),
                    itemBuilder: (context, index) {

                      if (isTyping && index == messages.length) {
                        return const TypingIndicator();
                      }

                      final msg = messages[index];

                      final prev =
                          index > 0 ? messages[index - 1] : null;
                      final next = index < messages.length - 1
                          ? messages[index + 1]
                          : null;

                      /// ✅ GROUPING LOGIC
                      final isFirst = prev == null ||
                          prev.senderId != msg.senderId;

                      final isLast = next == null ||
                          next.senderId != msg.senderId;

                      /// ✅ DATE SEPARATOR
                      final showDate = prev == null ||
                          !_isSameDay(
                              prev.timestamp, msg.timestamp);

                      return Column(
                        children: [

                          if (showDate)
                            DateSeparator(date: msg.timestamp),

                          ChatBubble(
                            message: msg,
                            isMe: msg.senderId == "me",
                            first: isFirst,
                            last: isLast,
                            onReply: (m) {
                              setState(() {
                                replyingTo = m;
                              });
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),

                ChatInputBar(
                  controller: controller,
                  onSend: sendMessage,
                  onImage: sendImage,
                  onVoiceStart: startRecording,
                  onVoiceEnd: stopRecording,
                  isRecording: isRecording,
                  /// ✅ ADD THESE
                  replyingTo: replyingTo,
                  onCancelReply: () {
                    setState(() {
                      replyingTo = null;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year &&
        a.month == b.month &&
        a.day == b.day;
  }
}
