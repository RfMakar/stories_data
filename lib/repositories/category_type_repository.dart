import 'package:stories_data/data/rest_client.dart';
import 'package:stories_data/models/category_type_model.dart';

class CategoryTypeRepository {
  final RestClient _restClient;

  CategoryTypeRepository(this._restClient);

  Future<List<CategoryTypeModel>> getCategoriesTypes({
    bool? withCategories,
  }) async {
    final res = await _restClient.getCategoriesTypes(
      withCategories: withCategories,
    );
    return res;
  }

  Future<CategoryTypeModel> getCategoryType({required String id}) async {
    final res = await _restClient.getCategoryType(id: id);
    return res;
  }

  Future<CategoryTypeModel> createCategoryType({required String name}) async {
    final res = await _restClient.createCategoryType(name: name);
    return res;
  }

  Future<CategoryTypeModel> updateCategoryType({
    required String id,
    required String name,
  }) async {
    final res = await _restClient.updateCategoryType(id: id, name: name);
    return res;
  }

  Future<void> deleteCategoryType({required String id}) async {
    await _restClient.deleteCategoryType(id: id);
  }

  Future<void> deleteCategoriesTypes() async {
    await _restClient.deleteCategoriesTypes();
  }
}
