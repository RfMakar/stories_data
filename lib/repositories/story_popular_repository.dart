import 'package:stories_data/data/rest_client.dart';
import 'package:stories_data/domain/period.dart';
import 'package:stories_data/models/story_model.dart';

class StoryPopularRepository {
  final RestClient _restClient;

  StoryPopularRepository(this._restClient);

  Future<StoryModel> getStoryTopToDay() async {
    final res = await _restClient.getStoryPopular(
      filter: Period.day.name,
    );
    return res;
  }

  Future<List<StoryModel>> getStoriesTopToWeek() async {
    final res = await _restClient.getStoriesPopular(
      filter: Period.week.name,
    );
    return res;
  }

  Future<List<StoryModel>> getStoriesTopToMonth() async {
    final res = await _restClient.getStoriesPopular(
      filter: Period.month.name,
    );
    return res;
  }

  Future<List<StoryModel>> getStoriesNew() async {
    final res = await _restClient.getStoriesPopular(
      filter: Period.newItems.name,
    );
    return res;
  }
}
