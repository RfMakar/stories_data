import 'dart:io';

import 'package:dio/dio.dart';
import 'package:stories_data/core/di_stories_data.dart';
import 'package:stories_data/core/utils/logger.dart';
import 'package:dotenv/dotenv.dart';
import 'package:stories_data/stories_data.dart';
///
///
///Не запускай на проде тесты!!!
///
///
///
Future<void> main(List<String> args) async {
  final env = DotEnv(includePlatformEnvironment: true)..load();
  final apiKey = env['API_KEY'] ?? "";
  await StoriesData.init(apiKey: apiKey);

  try {
    // await _testCategoryApi();
    await _testStoryApi();
    // await _testStoryCategoriesApi();
    // await _testStoryPopularApi();
    // await _testSearchCategoryApi();
    // await _testSearchStoryApi();
  } on DioException catch (e) {
    final code = e.response?.statusCode;
    final msg = e.message;
    logger.e('Code: $code, Msg: $msg');
  } catch (e) {
    logger.e(e.toString());
  }
}

Future<void> _testCategoryApi() async {
  final categoryRepository = diStoriesData<CategoryRepository>();

  final createCategory = await categoryRepository.createCategory(
    name: 'Новая категория3',
    icon: File('assets/img_1.png'),
  );

  logger.i('Категория создана');

  final categoryId = createCategory.id;

  await categoryRepository.updateCategory(
    id: categoryId,
    name: 'Обновленная категория3',
    icon: File('assets/img_2.png'),
  );

  logger.i('Категория обновлена');

  await categoryRepository.getCategory(id: categoryId);

  logger.i('Категория получена');

  await categoryRepository.getCategories();

  logger.i('Категории получены');

  await categoryRepository.deleteCategory(id: categoryId);

  logger.i('Категория удалена');

  await categoryRepository.createCategory(
    name: 'Новая категория3',
    icon: File('assets/img_1.png'),
  );

  await categoryRepository.deleteCategories();

  logger.i('Категория удалены');
}

Future<void> _testStoryApi() async {
  final storyRepository = diStoriesData<StoryRepository>();

  final createStory = await storyRepository.createStory(
    title: 'Новая сказка',
    description: 'Описанме сказки',
    content: 'Контент сказки',
    image: File('assets/img_1.png'),
    audio: File('assets/audio_1.m4a'),
  );

  logger.i('Сказка создана');

  final storyId = createStory.id;

  await storyRepository.updateStory(
    id: storyId,
    title: 'Обновленная сказка',
    description: 'ddddd',
    content: 'Обновленный контент сказки',
    image: File('assets/img_2.png'),
    audio: File('assets/audio_2.m4a'),
  );

  logger.i('Сказка обновлена и добавлена аудио');

  await storyRepository.getStory(id: storyId);

  logger.i('Сказка получена');

  // await storyRepository.getStories();

  // logger.i('Сказки получены');

  // await storyRepository.deleteStory(id: storyId);

  // logger.i('Сказка удалена');

  // await storyRepository.createStory(
  //   title: 'Новая сказка',
  //   description: 'Jgbcfybt cdsdf',
  //   content: 'Контент сказки',
  //   image: File('assets/img_1.png'),
  // );

  // await storyRepository.deleteStories();

  // logger.i('Сказки удалены');
}

Future<void> _testStoryCategoriesApi() async {
  final categoryRepository = diStoriesData<CategoryRepository>();
  final storyRepository = diStoriesData<StoryRepository>();
  final storyCategoriesRepository = diStoriesData<StoryCategoriesRepository>();

  final createCategory = await categoryRepository.createCategory(
    name: 'Новая категория3',
    icon: File('assets/img_1.png'),
  );
  final createStory = await storyRepository.createStory(
    title: 'Новая сказка',
    description: 'уаукаа',
    content: 'Контент сказки',
    image: File('assets/img_1.png'),
  );

  final categoryId = createCategory.id;
  final storyId = createStory.id;
  try {
    await storyCategoriesRepository.createCategoryToStory(
      storyId: storyId,
      categoryId: categoryId,
    );
  } catch (e) {
    logger.e(e.toString());
  }

  logger.i('Связь категории с историей создана');

  await storyCategoriesRepository.deleteCategoryToStory(
    storyId: storyId,
    categoryId: categoryId,
  );
  logger.i('Связь категории с историей удалена');
}

Future<void> _testStoryPopularApi() async {
  final storyPopularRepository = diStoriesData<StoryPopularRepository>();

  await storyPopularRepository.getStoryTopToDay();
  logger.i('Получена сказка популярная за день');

  await storyPopularRepository.getStoriesTopToWeek();
  logger.i('Получены популярные сказки за неделю');

  await storyPopularRepository.getStoriesTopToMonth();
  logger.i('Получены популярные сказки за неделю');

  await storyPopularRepository.getStoriesNew();
  logger.i('Получены новые сказки');
}

Future<void> _testSearchCategoryApi() async {
  final categoryRepository = diStoriesData<CategoryRepository>();
  final searchRepository = diStoriesData<SearchRepository>();

  final createCategory = await categoryRepository.createCategory(
    name: 'Новая категория для поиска',
    icon: File('assets/img_1.png'),
  );

  logger.i('Категория для поиска создана');

  final categories = await searchRepository.getSearchCategories(
    query: 'НОВАЯ',
  );
  logger.i('Поиск категорий успешный');
  logger.i(categories.toString());

  final categoryId = createCategory.id;

  await categoryRepository.deleteCategory(id: categoryId);

  logger.i('Категория удалена');
}

Future<void> _testSearchStoryApi() async {
  final searchRepository = diStoriesData<SearchRepository>();
  final storyRepository = diStoriesData<StoryRepository>();

  final createStory = await storyRepository.createStory(
    title: 'Новая сказка',
    description: 'Описанме сказки',
    content: 'Контент сказки',
    image: File('assets/img_1.png'),
  );

  logger.i('Сказка для поиска создана');

  final stories = await searchRepository.getSearchStories(
    query: 'НовАЯ сказка',
  );
  logger.i('Поиск сказок успешный');
  logger.i(stories.toString());

  final storyId = createStory.id;

  await storyRepository.deleteStory(id: storyId);

  logger.i('Сказка для поиска удалена');
}
