import 'package:flutter/material.dart';

import '../../models/chat_model.dart';
import '../../models/call_model.dart';
import '../../widgets/chat_item.dart';
import 'private_chat_screen.dart';
import 'calls_tab.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {

  int selectedTab = 0;
  late PageController _pageController;

  /// CHAT DATA
  List<ChatModel> chats = [
    ChatModel(
      name: "Jenny",
      message: "Wanna video chat? ❤️",
      time: "5 mins ago",
      image: "assets/images/stream1.jpg",
      unreadCount: 2,
    ),
    ChatModel(
      name: "Lisa",
      message: "Hello!",
      time: "15m",
      image: "assets/images/stream2.jpg",
    ),
  ];

  /// CALL DATA
  List<CallModel> calls = [
    CallModel(
      name: "Jenny",
      image: "assets/images/stream1.jpg",
      time: "Yesterday",
      type: CallType.video,
      status: CallStatus.missed,
    ),
  ];

  /// TOTAL UNREAD
  int get totalUnread =>
      chats.fold(0, (sum, chat) => sum + chat.unreadCount);

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
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

                /// TOP BAR
                const Text(
                  "Messages",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),

                const SizedBox(height: 10),

                /// TABS
                _buildTabs(),

                const SizedBox(height: 10),

                /// PAGE VIEW (SWIPE)
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() => selectedTab = index);
                    },
                    children: [
                      _buildMessages(),
                      CallsTab(calls: calls),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// MESSAGES LIST
  Widget _buildMessages() {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];

        return ChatItem(
          name: chat.name,
          message: chat.message,
          time: chat.time,
          image: chat.image,
          unread: chat.unreadCount > 0,
          onTap: () {

            /// MARK AS READ
            setState(() {
              chat.unreadCount = 0;
            });

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PrivateChatScreen(
                  image: chat.image,
                  name: chat.name,
                ),
              ),
            );
          },
        );
      },
    );
  }

  /// TABS WITH INDICATOR
  Widget _buildTabs() {
    return Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _tabItem("Messages", Icons.chat, 0),
            const SizedBox(width: 40),
            _tabItem("Calls", Icons.call, 1),
          ],
        ),

        const SizedBox(height: 5),

        /// ANIMATED INDICATOR
        AnimatedBuilder(
          animation: _pageController,
          builder: (context, child) {
            double position =
                _pageController.hasClients ? _pageController.page ?? 0 : 0;

            return Transform.translate(
              offset: Offset((position * 80) - 40, 0),
              child: Container(
                height: 3,
                width: 30,
                color: Colors.purple,
              ),
            );
          },
        ),
      ],
    );
  }

  /// TAB ITEM
  Widget _tabItem(String text, IconData icon, int index) {
    final isSelected = selectedTab == index;

    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: Row(
        children: [

          Icon(
            icon,
            color: isSelected ? Colors.white : Colors.white54,
          ),

          const SizedBox(width: 5),

          Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white54,
            ),
          ),

          /// BADGE
          if (index == 0 && totalUnread > 0)
            Container(
              margin: const EdgeInsets.only(left: 6),
              padding:
                  const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "$totalUnread",
                style: const TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
