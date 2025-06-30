import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:stories_data/data/dio_client.dart';
import 'package:stories_data/data/rest_client.dart';
import 'package:stories_data/stories_data.dart';

final diStoriesData = GetIt.instance;

Future<void> setupDiStroiesData({required String apiKey}) async {
  //Dio
  diStoriesData.registerLazySingleton(() => DioClient(dio: Dio(), apiKey: apiKey)..init());

  //RestClient
  diStoriesData.registerLazySingleton(() => RestClient(diStoriesData<DioClient>().dio));

  //Repositories
  diStoriesData.registerLazySingleton(() => CategoryRepository(diStoriesData()));

  diStoriesData.registerLazySingleton(() => StoryRepository(diStoriesData()));

  diStoriesData.registerLazySingleton(() => StoryCategoriesRepository(diStoriesData()));

  diStoriesData.registerLazySingleton(() => StoryPopularRepository(diStoriesData()));

   diStoriesData.registerLazySingleton(() => SearchRepository(diStoriesData()));
}
