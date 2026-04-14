import 'dart:io';
import 'package:just_waveform/just_waveform.dart';
import 'package:path_provider/path_provider.dart';

class WaveformService {
  Future<Waveform> generateWaveform(String path) async {
    final dir = await getTemporaryDirectory();

    final file = File(
        '${dir.path}/${DateTime.now().millisecondsSinceEpoch}.wave');

    final stream = JustWaveform.extract(
      audioInFile: File(path),
      waveOutFile: file,
    );

    Waveform? waveform;

    await for (final progress in stream) {
      if (progress.waveform != null) {
        waveform = progress.waveform;
      }
    }

    return waveform!;
  }
}
