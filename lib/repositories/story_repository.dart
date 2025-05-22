import 'dart:io';

import 'package:stories_data/data/rest_client.dart';
import 'package:stories_data/stories_data.dart';

class StoryRepository {
  final RestClient _restClient;

  StoryRepository(this._restClient);

  Future<List<StoryModel>> getStories() async {
    final res = await _restClient.getStories();
    return res;
  }

  Future<StoryModel> getStory({required String id}) async {
    final res = await _restClient.getStory(id: id);
    return res;
  }

  Future<StoryModel> createStory({
    required String title,
    required String content,
    required File image,
  }) async {
    final res = await _restClient.createStory(
      title: title,
      content: content,
      image: image,
    );
    return res;
  }

  Future<StoryModel> updateStory({
    required String id,
    String? title,
    String? content,
    File? image,
  }) async {
    final res = await _restClient.updateStory(
      id: id,
      title: title,
      content: content,
      image: image,
    );
    return res;
  }

  Future<void> deleteStory({required String id}) async {
    await _restClient.deleteStory(id: id);
  }

  Future<void> deleteStories() async {
    await _restClient.deleteStories();
  }
}
