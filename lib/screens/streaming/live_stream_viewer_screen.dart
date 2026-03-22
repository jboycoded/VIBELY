import 'package:flutter/material.dart';

class LiveStreamViewerScreen extends StatefulWidget {
  const LiveStreamViewerScreen({super.key});

  @override
  State<LiveStreamViewerScreen> createState() => _LiveStreamViewerScreenState();
}

class _LiveStreamViewerScreenState extends State<LiveStreamViewerScreen> {

  final TextEditingController messageController = TextEditingController();

  List<String> messages = [
    "Alex: Hello!",
    "Jane: Nice stream 🔥",
    "Mike: Where are you from?",
  ];

  void sendMessage() {
    if (messageController.text.isEmpty) return;

    setState(() {
      messages.add("Me: ${messageController.text}");
    });

    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          /// 🎥 VIDEO PLACEHOLDER
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/streamer1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// DARK OVERLAY
          Container(
            color: Colors.black.withOpacity(0.3),
          ),

          SafeArea(
            child: Column(
              children: [

                /// 🔝 TOP BAR
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      /// HOST INFO
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 18,
                            backgroundImage: AssetImage("assets/images/streamer1.jpg"),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("JohnLive",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              Text("5.2K watching",
                                  style: TextStyle(color: Colors.white70, fontSize: 12)),
                            ],
                          )
                        ],
                      ),

                      /// CLOSE BUTTON
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close, color: Colors.white),
                      )
                    ],
                  ),
                ),

                const Spacer(),

                /// 💬 CHAT SECTION
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                        child: Text(
                          messages[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),

                /// INPUT + ACTIONS
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [

                      /// MESSAGE INPUT
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: TextField(
                            controller: messageController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Send a message...",
                              hintStyle: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      /// ❤️ LIKE BUTTON
                      IconButton(
                        onPressed: () {
                          // TODO: animate hearts later
                        },
                        icon: const Icon(Icons.favorite, color: Colors.pink),
                      ),

                      /// 🎁 GIFT BUTTON
                      IconButton(
                        onPressed: () {
                          // TODO: open gift panel
                        },
                        icon: const Icon(Icons.card_giftcard, color: Colors.amber),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
