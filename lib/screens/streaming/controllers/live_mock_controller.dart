import 'dart:async';
import 'dart:math';

import '../../../models/live_stream.dart';
import '../../../models/comment.dart';

class LiveMockController {
  Timer? viewerTimer;
  Timer? chatTimer;

  Future<LiveStream> initializeMock({
    required Function(int) onViewerUpdate,
    required Function(List<CommentModel>) onNewComment,
  }) async {
    await Future.delayed(
      Duration(milliseconds: 1500 + Random().nextInt(1500)),
    );

    final stream = LiveStream(
      id: "1",
      hostName: "Cydknee",
      title: "Live vibes 🔥",
      viewers: 534,
      likes: 1200,
      isLive: true,
    );

    _startMockViewers(stream, onViewerUpdate);
    _startMockChat(onNewComment);

    return stream;
  }

  void _startMockViewers(
      LiveStream stream, Function(int) update) {
    viewerTimer =
        Timer.periodic(const Duration(seconds: 3), (_) {
      update(stream.viewers + Random().nextInt(5));
    });
  }

  void _startMockChat(Function(List<CommentModel>) update) {
    final names = ["Mike", "Anna", "Peace", "John", "Alex"];
    List<CommentModel> comments = [];

    chatTimer =
        Timer.periodic(const Duration(seconds: 2), (_) {
      comments.add(CommentModel(
        username: names[Random().nextInt(names.length)],
        message: "🔥🔥🔥",
        time: DateTime.now(),
      ));

      if (comments.length > 50) comments.removeAt(0);

      update(List.from(comments));
    });
  }

  void dispose() {
    viewerTimer?.cancel();
    chatTimer?.cancel();
  }
}
