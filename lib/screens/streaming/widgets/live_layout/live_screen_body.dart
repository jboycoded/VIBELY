import 'package:flutter/material.dart';

import '../../../public_profile/public_profile_page.dart';

import '../../../../models/live_stream.dart';
import '../../../../models/comment.dart';
import '../../../../models/gift.dart';
import '../../../../models/user_model.dart';

import '../../../../widgets/livestream_widgets/live_top_bar.dart';
import '../../../../widgets/livestream_widgets/live_right_actions.dart';
import '../../../../widgets/livestream_widgets/live_chat_section.dart';
import '../../../../widgets/livestream_widgets/live_input_bar.dart';
import '../../../../widgets/livestream_widgets/gift_quick_bar.dart';
import '../../../../widgets/livestream_widgets/reactions_overlay.dart';
import '../../../../widgets/livestream_widgets/gift_overlay.dart';

class LiveScreenBody extends StatelessWidget {
  final LiveStream liveStream;
  final List<CommentModel> comments;

  final LiveStream userLiveStream;
  final UserModel user;

  final VoidCallback onLike;
  final VoidCallback onShare;
  final VoidCallback onGiftPanel;
  final Function(GiftModel gift) onGiftSend;
  final Function(String message) onSendMessage;
  final VoidCallback onExit;

  final GlobalKey reactionsKey;
  final GlobalKey giftKey;

  LiveScreenBody({
    super.key,
    required this.liveStream,
    required this.comments,
    required this.onLike,
    required this.onShare,
    required this.onGiftPanel,
    required this.onGiftSend,
    required this.onSendMessage,
    required this.onExit,
    required this.reactionsKey,
    required this.giftKey,
  }) : userLiveStream = liveStream.user != null 
          ? liveStream 
          : liveStream.copyWith(
              user: UserModel(
      name: "Cydnee",
      username: "Cydnee",
      email: "johnson.onoja1@gmail.com"
      id: "1000",
      age: 22,
      country: "US",
      bio: "Live streamer | Chill vibes 🎧 | Night streams 🌙",
      gender: "male",
      imageUrl: "assets/images/streamer1.jpg",
    ),
            ),
       user = (liveStream.user != null) 
          ? liveStream.user! 
          : UserModel(id: "1000", name: "Cydnee", username: "Cydnee", email: "johnson.onoja1@gmail.com", age: 22,
                     bio: "Just here to have fun, vibe with amazing people abd spread good energy.🥂💫💜",
                     gender: "male", country: "US", imageUrl: "assets/images/streamer1.jpg");


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        /// 🎥 BACKGROUND
        Positioned.fill(
          child: Image.asset(
            "assets/images/streamer1.jpg",
            fit: BoxFit.cover,
          ),
        ),

        /// 🌑 GRADIENT
        const _LiveGradient(),

        /// 🎉 EFFECT OVERLAYS
        ReactionsOverlay(key: reactionsKey),
        GiftOverlay(key: giftKey),

        /// 🔝 TOP BAR
        Positioned(
          top: 50,
          left: 16,
          right: 16,
          child: LiveTopBar(
            name: liveStream.hostName,
            title: liveStream.title,
            viewers: liveStream.viewers,
            onClose: onExit,
            onHostTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => PublicProfileScreen(
        user: user
      ),
    ),
  );
},
          ),
        ),

        /// 👉 RIGHT ACTIONS
        Positioned(
          right: 10,
          bottom: 120,
          child: LiveRightActions(
            likes: liveStream.likes,
            onLike: onLike,
            onGiftTap: onGiftPanel,
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

        /// 🎁 QUICK GIFTS
        Positioned(
          left: 10,
          right: 10,
          bottom: 70,
          child: GiftQuickBar(
            onGiftTap: onGiftSend,
          ),
        ),

        /// ✍ INPUT
        Positioned(
          left: 10,
          right: 10,
          bottom: 20,
          child: LiveInputBar(
            onSend: onSendMessage,
          ),
        ),
      ],
    );
  }
}

/// 🌑 GRADIENT WIDGET (PRIVATE)
class _LiveGradient extends StatelessWidget {
  const _LiveGradient();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
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
    );
  }
}
