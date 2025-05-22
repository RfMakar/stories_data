import 'dart:io';

import 'package:stories_data/core/di.dart';
import 'package:stories_data/core/utils/logger.dart';
import 'package:stories_data/repositories/index.dart';

Future<void> main(List<String> args) async {
  await setupDI();

  await _testCategoryApi();
  await _testStoryApi();
}

Future<void> _testCategoryApi() async {
  final categoryRepository = sl<CategoryRepository>();

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
  final storyRepository = sl<StoryRepository>();

  final createStory = await storyRepository.createStory(
    title: 'Новая сказка',
    content: 'Контент сказки',
    image: File('assets/img_1.png'),
  );

  logger.i('Сказка создана');

  final storyId = createStory.id;

  await storyRepository.updateStory(
    id: storyId,
    title: 'Обновленная сказка',
    content: 'Обновленный контент сказки',
    image: File('assets/img_2.png'),
  );

  logger.i('Сказка обновлена');

  await storyRepository.getStory(id: storyId);

  logger.i('Сказка получена');

  await storyRepository.getStories();

  logger.i('Сказки получены');

  await storyRepository.deleteStory(id: storyId);

  logger.i('Сказка удалена');

  await storyRepository.createStory(
    title: 'Новая сказка',
    content: 'Контент сказки',
    image: File('assets/img_1.png'),
  );

  await storyRepository.deleteStories();

  logger.i('Сказки удалены');
}
