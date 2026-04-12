import 'package:flutter/material.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {

  int selectedTab = 0;
  late PageController _pageController;

  List<ConversationModel> conversations = [];
  List<CallModel> calls = [];

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    _initMockData();
    _startMockUpdates();
  }

  void _initMockData() {
    final user1 = UserModel(
      id: "1000",
      name: "Jenny",
      age: 22,
      bio: "",
      country: "US",
      imageUrl: "assets/images/stream1.jpg",
      isOnline: true,
    );

    final user2 = UserModel(
      id: "1001",
      name: "Lisa",
      age: 24,
      bio: "",
      country: "UK",
      imageUrl: "assets/images/stream2.jpg",
      isOnline: false,
    );

    conversations = [
      ConversationModel(
        id: "c1",
        user: user1,
        lastMessage: MessageModel(
          id: "m1",
          senderId: user1.id,
          text: "Wanna video chat? ❤️",
          timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
        ),
        unreadCount: 2,
      ),
      ConversationModel(
        id: "c2",
        user: user2,
        lastMessage: MessageModel(
          id: "m2",
          senderId: user2.id,
          text: "Hello!",
          timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
        ),
      ),
    ];

    calls = [
      CallModel(
        id: "call1",
        user: user1,
        time: DateTime.now().subtract(const Duration(days: 1)),
        type: CallType.video,
        status: CallStatus.missed,
      ),
    ];
  }

  /// 🧪 FAKE REAL-TIME UPDATES
  void _startMockUpdates() {
    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;

      setState(() {
        conversations[0] = conversations[0].copyWith(
          unreadCount: conversations[0].unreadCount + 1,
          lastMessage: MessageModel(
            id: DateTime.now().toString(),
            senderId: conversations[0].user.id,
            text: "Hey, are you there? 👀",
            timestamp: DateTime.now(),
          ),
        );
      });

      _startMockUpdates();
    });
  }

  int get totalUnread =>
      conversations.fold(0, (sum, c) => sum + c.unreadCount);

  void _openChat(ConversationModel convo) {
    setState(() {
      final index =
          conversations.indexWhere((c) => c.id == convo.id);

      conversations[index] =
          conversations[index].copyWith(unreadCount: 0);
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PrivateChatScreen(conversation: convo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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

          Container(color: Colors.black.withOpacity(0.5)),

          SafeArea(
            child: Column(
              children: [

                ChatsHeader(
                  totalUnread: totalUnread,
                  selectedTab: selectedTab,
                  onTabTap: (index) {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  controller: _pageController,
                ),

                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (i) =>
                        setState(() => selectedTab = i),
                    children: [
                      ChatsList(
                        conversations: conversations,
                        onTap: _openChat,
                      ),
                      CallList(calls: calls),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
