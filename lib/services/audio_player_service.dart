import 'package:audioplayers/audioplayers.dart';

class AudioPlayerService {
  final AudioPlayer _player = AudioPlayer();

  Future<void> play(String path) async {
    await _player.play(DeviceFileSource(path));
  }

  Future<void> stop() async {
    await _player.stop();
  }
}
