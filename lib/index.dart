
import 'package:stories_data/core/di.dart';

class StoriesData {
  static Future<void> init({required String apiKey}) async {
    await setupDI(apiKey: apiKey);
  }
}
