import 'package:just_audio/just_audio.dart';

class VoicePlaybackController {
  final AudioPlayer player = AudioPlayer();

  String? currentMessageId;
  Function()? onNext;

  Future<void> play({
    required String messageId,
    required String path,
    Function()? onCompleted,
  }) async {
    if (currentMessageId != messageId) {
      await player.setFilePath(path);
      currentMessageId = messageId;
    }

    onNext = onCompleted;

    await player.play();
  }

  Future<void> pause() async {
    await player.pause();
  }

  void listenCompletion() {
    player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        onNext?.call();
      }
    });
  }

  Stream<Duration> get positionStream => player.positionStream;

  Duration get duration => player.duration ?? Duration.zero;
}
