
import 'package:stories_data/core/di_stories_data.dart';

class StoriesData {
  static Future<void> init({required String apiKey}) async {
    await setupDiStroiesData(apiKey: apiKey);
  }
}
