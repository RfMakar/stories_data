import 'dart:io';

import 'package:stories_data/core/di.dart';
import 'package:stories_data/core/utils/logger.dart';
import 'package:stories_data/repositories/category_repository.dart';

Future<void> main(List<String> args) async {
  await setupDI();

  await _testCategoryApi();
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
