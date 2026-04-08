import 'dart:async';
import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../models/live_stream.dart';
import '../../models/comment.dart';
import '../../models/gift.dart';

import '../../widgets/livestream_widgets/live_top_bar.dart';
import '../../widgets/livestream_widgets/live_right_actions.dart';
import '../../widgets/livestream_widgets/live_chat_section.dart';
import '../../widgets/livestream_widgets/live_input_bar.dart';
import '../../widgets/livestream_widgets/reactions_overlay.dart';
import '../../widgets/livestream_widgets/gift_quick_bar.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({super.key});

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> 
with WidgetsBindingObserver {
  final GlobalKey<_GiftOverlayState> giftKey = GlobalKey();
  final GlobalKey<_ReactionsOverlayState> reactionsKey = GlobalKey();

  /// variables for internet connectivity
  late Stream<List<ConnectivityResult>> connectivityStream; 
  bool isConnected = true;
  
  /// 🧠 CORE STATE
  late LiveStream liveStream;
  List<CommentModel> comments = [];
  bool isMockMode = true;
  bool streamEnded = false;
  bool isLoading = false;

  Timer? viewerTimer;
  Timer? chatTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    /// Start mock systems
    if (isMockMode) {
    _mockInitialize();
  } else {
      // TODO: LATER
    //_realInitialize(); // future backend
    }

    /// 🌐 INTERNET LISTENER
  connectivityStream = Connectivity().onConnectivityChanged;

  connectivityStream.listen((results) {
  final hasConnection =
      results.any((r) => r != ConnectivityResult.none);

  if (hasConnection != isConnected) {
    setState(() {
      isConnected = hasConnection;
    });

    if (!hasConnection) {
      showSnack("❌ No Internet Connection");
    } else {
      showSnack("✅ Back Online");
    }
  }
});
    }

  Future<void> _mockInitialize() async {
  setState(() {
    isLoading = true;
  });

  /// Simulate API delay
  await Future.delayed(
  Duration(milliseconds: 1500 + Random().nextInt(1500)),
);
  /// Initialize stream data
  liveStream = LiveStream(
    id: "1",
    hostName: "Cydknee",
    title: "Live vibes 🔥",
    viewers: 534,
    likes: 1200,
    isLive: true,
  );

  /// Start mock systems
  startMockViewers();
  startMockChat();

  /// Remove loading
  if (!mounted) return;
  setState(() {
    isLoading = false;
  });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    
    viewerTimer?.cancel();
    chatTimer?.cancel();
    super.dispose();
  }

  /// 👁️ Viewer Simulation
  void startMockViewers() {
    viewerTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      setState(() {
        liveStream = liveStream.copyWith(
          viewers: liveStream.viewers + Random().nextInt(5),
        );
      });
    });
  }

  /// 💬 Chat Simulation
  void startMockChat() {
    final names = ["Mike", "Anna", "Peace", "John", "Alex"];

    chatTimer = Timer.periodic(const Duration(seconds: 2), (_) {
      setState(() {
        comments.add(
          CommentModel(
            username: names[Random().nextInt(names.length)],
            message: "🔥🔥🔥",
            time: DateTime.now(),
          ),
        );

        /// Limit to last 50 messages
        if (comments.length > 50) {
          comments.removeAt(0);
        }
      });
    });
  }

  Widget _buildOverlay() {
  /// ❌ NO INTERNET (Highest Priority)
  if (!isConnected) {
    return _noInternetOverlay();
  }

  /// ⏳ LOADING
  if (isLoading) {
    return _loadingOverlay();
  }

  /// 🎬 STREAM ENDED
  if (streamEnded) {
    return _endedOverlay();
  }

  return const SizedBox.shrink();
  }

  Widget _noInternetOverlay() {
  return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        color: Colors.black.withOpacity(0.6),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.wifi_off, color: Colors.white, size: 40),
                SizedBox(height: 10),
                Text(
                  "No Internet Connection",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: 6),
                Text(
                  "Reconnecting...",
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loadingOverlay() {
  return Container(
      color: Colors.black.withOpacity(0.7),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 12),
            Text(
              "Joining live...",
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  Widget _endedOverlay() {
  return Container(
      color: Colors.black.withOpacity(0.85),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Live Ended",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Exit"),
            )
          ],
        ),
      ),
    );
  }

  /// ✍ Send Message
  void sendMessage(String text) {
    if (!isConnected) return;
    
    if (text.trim().isEmpty) return;

    setState(() {
      comments.add(
        CommentModel(
          username: "You",
          message: text,
          time: DateTime.now(),
        ),
      );
    });
  }

  /// 🎁 Send Gift
  void sendGift(GiftModel gift) {
    if (!isConnected) return;
  
    //TODO: REMEMBER TO USE IT FOR AN IMAGE ASSET LATER
    //reactionsKey.currentState?.burstReactions(
  //asset: gift.asset,
  //count: 8, );

    reactionsKey.currentState?.burstReactions(
  emoji: gift.asset,
  count: 8,
);
    
    // Later: animation + backend
    showSnack("Gift t sent: ${gift.asset}");
  }

  void onLike() {
    if (!isConnected) return;
    
  setState(() {
    liveStream = liveStream.copyWith(
      likes: liveStream.likes + 1,
    );
  });
  reactionsKey.currentState?.addReaction(emoji: "❤️");
  
}

void onShare() {
  // later: share logic
  showSnack("Share clicked");
}

void openGiftPanel() {
  // later: expand gift UI or open full gift screen
  showSnack("Open gift panel");
}

  /// ❌ Exit Handling
  void exitStream() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Exit Live?"),
        content: const Text("Are you sure you want to leave the stream?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text("Exit"),
          ),
        ],
      ),
    );
  }

  void showSnack(String message) {
  if (!mounted) return;

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.black.withOpacity(0.8),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  @override
void didChangeAppLifecycleState(AppLifecycleState state) {
  if (state == AppLifecycleState.paused) {
    showSnack("⏸ App Paused");

    /// Later:
    /// pause stream, mute audio, etc.
  }

  if (state == AppLifecycleState.resumed) {
    showSnack("▶ App Resumed");

    /// Later:
    /// resume stream
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [

          /// 🎥 VIDEO
          Positioned.fill(
            child: Image.asset(
              "assets/images/streamer1.jpg",
              fit: BoxFit.cover,
            ),
          ),

          /// 🌑 GRADIENT
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black54,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black87,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          ReactionsOverlay(key: reactionsKey),
          GiftOverlay(key: giftKey),

          /// 🔝 TOP BAR (NOW DYNAMIC)
          Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: LiveTopBar(
              name: liveStream.hostName,
              title: liveStream.title,
              viewers: liveStream.viewers,
              onClose: exitStream,
            ),
          ),

          /// 👉 RIGHT ACTIONS
          Positioned(
            right: 10,
            bottom: 120,
            child: LiveRightActions(
  likes: liveStream.likes,
  onLike: onLike,
  onGiftTap: openGiftPanel,
  onShare: onShare,
),
          ),

          /// 💬 CHAT
          Positioned(
            left: 10,
            right: 80,
            bottom: 140,
            child: LiveChatSection(
              comments: comments,
            ),
          ),

          /// 🎁 GIFTS
          Positioned(
            left: 10,
            right: 10,
            bottom: 70,
            child: GiftQuickBar(
              onGiftTap: sendGift,
            ),
          ),

          /// ✍ INPUT
          Positioned(
            left: 10,
            right: 10,
            bottom: 20,
            child: LiveInputBar(
              onSend: sendMessage,
            ),
          ),

          /// ❤️ REACTIONS
          const ReactionsOverlay(),

            Positioned.fill(child: _buildOverlay()),
 
        ],
      ),
    );
  }
}
