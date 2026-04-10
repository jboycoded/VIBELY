import '../../../models/gift.dart';
import '../../../models/live_stream.dart';

class LiveInteractions {
  static LiveStream onLike({
    required bool isConnected,
    required LiveStream stream,
    required dynamic reactionsKey,
  }) {
    if (!isConnected) return stream;

    reactionsKey.currentState?.addReaction(emoji: "❤️");

    return stream.copyWith(
      likes: stream.likes + 1,
    );
  }

  static void sendGift({
    required bool isConnected,
    required GiftModel gift,
    required dynamic giftKey,
    required dynamic reactionsKey,
    required Function(String) showSnack,
  }) {
    if (!isConnected) return;

    if (gift.isBigGift) {
      giftKey.currentState?.showGift(gift.asset);
    } else {
      gift.isImage
          ? reactionsKey.currentState?.burstReactions(
              asset: gift.asset, count: 8)
          : reactionsKey.currentState?.burstReactions(
              emoji: gift.asset, count: 8);
    }

    showSnack("Gift sent: ${gift.asset}");
  }
}
