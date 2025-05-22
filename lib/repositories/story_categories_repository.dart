import 'package:stories_data/data/rest_client.dart';

class StoryCategoriesRepository {
  final RestClient _restClient;

  StoryCategoriesRepository(this._restClient);

  Future<void> createCategoryToStory({
    required String storyId,
    required String categoryId,
  }) async {
    await _restClient.createCategoryToStory(
      storyId: storyId,
      categoryId: categoryId,
    );
  }

  Future<void> deleteCategoryToStory({
    required String storyId,
    required String categoryId,
  }) async {
    await _restClient.deleteCategoryToStory(
      storyId: storyId,
      categoryId: categoryId,
    );
  }
}
