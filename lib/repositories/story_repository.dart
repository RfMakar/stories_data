import 'dart:io';

import 'package:stories_data/data/rest_client.dart';
import 'package:stories_data/stories_data.dart';

class StoryRepository {
  final RestClient _restClient;

  StoryRepository(this._restClient);

  Future<List<StoryModel>> getStories({String? categoryId}) async {
    final res = await _restClient.getStories(categoryId: categoryId);
    return res;
  }

  Future<StoryModel> getStory({required String id}) async {
    final res = await _restClient.getStory(id: id);
    return res;
  }

  Future<StoryModel> createStory({
    required String title,
    required String description,
    required String content,
    required File image,
    File? audio,
  }) async {
    final res = await _restClient.createStory(
      title: title,
      description: description,
      content: content,
      image: image,
      audio: audio,
    );
    return res;
  }

  Future<StoryModel> updateStory({
    required String id,
    String? title,
    String? description,
    String? content,
    File? image,
    File? audio,
  }) async {
    final res = await _restClient.updateStory(
      id: id,
      title: title,
      description: description,
      content: content,
      image: image,
      audio: audio,
    );
    return res;
  }

  Future<StoryModel> deleteAudioStory({required String id}) async {
    final res = await _restClient.deleteAudioStory(id: id);
    return res;
  }

  Future<void> deleteStory({required String id}) async {
    await _restClient.deleteStory(id: id);
  }

  Future<void> deleteStories() async {
    await _restClient.deleteStories();
  }
}
