import 'dart:io';

import 'package:stories_data/data/rest_client.dart';
import 'package:stories_data/models/category_model.dart';

class CategoryRepository {
  final RestClient _restClient;

  CategoryRepository(this._restClient);

  Future<List<CategoryModel>> getCategories() async {
    final res = await _restClient.getCategories();
    return res;
  }

  Future<CategoryModel> getCategory({required String id}) async {
    final res = await _restClient.getCategory(id: id);
    return res;
  }

  Future<CategoryModel> createCategory({
    required String name,
    required File icon,
  }) async {
    final res = await _restClient.createCategory(name: name, icon: icon);
    return res;
  }

  Future<CategoryModel> updateCategory({
    required String id,
    String? name,
    File? icon,
  }) async {
    final res = await _restClient.updateCategory(
      id: id,
      name: name,
      icon: icon,
    );
    return res;
  }

  Future<void> deleteCategory({required String id}) async {
    await _restClient.deleteCategory(id: id);
  }

  Future<void> deleteCategories() async {
    await _restClient.deleteCategories();
  }
}
