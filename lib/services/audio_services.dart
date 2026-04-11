import 'package:record/record.dart';

class AudioService {
  final _recorder = AudioRecorder();

  Future<bool> hasPermission() async {
    return await _recorder.hasPermission();
  }

  Future<void> startRecording(String path) async {
    await _recorder.start(
      const RecordConfig(),
      path: path,
    );
  }

  Future<String?> stopRecording() async {
    return await _recorder.stop();
  }
}
