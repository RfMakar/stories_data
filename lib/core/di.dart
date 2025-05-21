import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:stories_data/data/dio_client.dart';
import 'package:stories_data/data/rest_client.dart';
import 'package:stories_data/repositories/category_repository.dart';

final sl = GetIt.instance;

Future<void> setupDI() async {
  //Dio
  sl.registerLazySingleton(() => DioClient(dio: Dio())..init());

  //RestClient
  sl.registerLazySingleton(() => RestClient(sl<DioClient>().dio));

  //Repositories
  sl.registerLazySingleton(() => CategoryRepository(sl()));
}
