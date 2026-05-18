import 'dart:io';
import 'dart:typed_data';

import 'package:stories_data/data/content_rest_client.dart';

import '../models/index.dart';

class ContentRepository {
  final ContentRestClient _restClient;

  ContentRepository(this._restClient);

  Future<String> generateText({
    required String prompt,
    required String systemPrompt,
    double temperature = 0.7,
  }) async {
    final res = await _restClient.generateText(
      GenerateTextRequest(
        prompt: prompt,
        systemPrompt: systemPrompt,
        temperature: temperature,
      ),
    );

    return res.text;
  }

  Future<Uint8List> generateImageBytes({required String prompt}) async {
    final res = await _restClient.generateImage(
      GenerateImageRequest(prompt: prompt),
    );

    return Uint8List.fromList(res.data);
  }

  Future<Uint8List> generateAudioBytes({required String text}) async {
    final res = await _restClient.generateAudio(
      GenerateAudioRequest(text: text),
    );

    return Uint8List.fromList(res.data);
  }

  Future<File> generateImageFile({
    required String prompt,
    required Directory outputDir,
    String? fileName,
  }) async {
    final bytes = await generateImageBytes(prompt: prompt);

    final safeFileName =
        fileName ??
        'generated_image_${DateTime.now().millisecondsSinceEpoch}.jpg';

    final file = File('${outputDir.path}/$safeFileName');

    await file.writeAsBytes(bytes, flush: true);

    return file;
  }

  Future<File> generateAudioFile({
    required String text,
    required Directory outputDir,
    String? fileName,
  }) async {
    final bytes = await generateAudioBytes(text: text);

    final safeFileName =
        fileName ??
        'generated_audio_${DateTime.now().millisecondsSinceEpoch}.mp3';

    final file = File('${outputDir.path}/$safeFileName');

    await file.writeAsBytes(bytes, flush: true);

    return file;
  }
}
