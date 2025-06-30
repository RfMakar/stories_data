import 'package:stories_data/data/rest_client.dart';
import 'package:stories_data/stories_data.dart';

class SearchRepository {
  final RestClient _restClient;

  SearchRepository(this._restClient);

  Future<List<CategoryModel>> getSearchCategories({required String query}) async {
    final res = await _restClient.getSearchCategories(query: query);
    return res;
  }

  Future<List<StoryModel>> getSearchStories({required String query}) async {
    final res = await _restClient.getSearchStories(query: query);
    return res;
  }
}
