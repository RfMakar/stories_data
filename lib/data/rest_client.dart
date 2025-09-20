import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:stories_data/core/constans.dart';
import 'package:stories_data/core/endpoints.dart';
import 'package:stories_data/models/category_type_model.dart';

import '../models/index.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: apiUrl)
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  //Story
  @GET(EndPoints.story)
  Future<List<StoryModel>> getStories({
    @Query('categoryId') String? categoryId,
  });

  @GET('${EndPoints.story}{id}')
  Future<StoryModel> getStory({@Path() required String id});

  @POST(EndPoints.story)
  Future<StoryModel> createStory({
    @Part() required String title,
    @Part() required String description,
    @Part() required String content,
    @Part() required File image,
    @Part() File? audio,
  });

  @PUT('${EndPoints.story}{id}')
  Future<StoryModel> updateStory({
    @Path() required String id,
    @Part() String? title,
    @Part() String? description,
    @Part() String? content,
    @Part() File? image,
    @Part() File? audio,
  });

  @DELETE('${EndPoints.story}{id}/audio')
  Future<StoryModel> deleteAudioStory({@Path() required String id});

  @DELETE('${EndPoints.story}{id}')
  Future<void> deleteStory({@Path() required String id});

  @DELETE(EndPoints.story)
  Future<void> deleteStories();

  //Category
  @GET(EndPoints.category)
  Future<List<CategoryModel>> getCategories();

  @GET('${EndPoints.category}{id}')
  Future<CategoryModel> getCategory({@Path() required String id});

  @POST(EndPoints.category)
  Future<CategoryModel> createCategory({
    @Part() required String name,
    @Part(name: 'type_id') required String typeId,
    @Part() required File icon,
  });

  @PUT('${EndPoints.category}{id}')
  Future<CategoryModel> updateCategory({
    @Path() required String id,
    @Part() String? name,
    @Part(name: 'type_id') String? typeId,
    @Part() File? icon,
  });

  @DELETE('${EndPoints.category}{id}')
  Future<void> deleteCategory({@Path() required String id});

  @DELETE(EndPoints.category)
  Future<void> deleteCategories();

  //CategoryType
  @GET(EndPoints.categoryType)
  Future<List<CategoryTypeModel>> getCategoriesTypes();

  @GET('${EndPoints.categoryType}{id}')
  Future<CategoryTypeModel> getCategoryType({@Path() required String id});

  @POST(EndPoints.categoryType)
  Future<CategoryTypeModel> createCategoryType({@Part() required String name});

  @PUT('${EndPoints.categoryType}{id}')
  Future<CategoryTypeModel> updateCategoryType({
    @Path() required String id,
    @Part() required String name,
  });

  @DELETE('${EndPoints.categoryType}{id}')
  Future<void> deleteCategoryType({@Path() required String id});

  @DELETE(EndPoints.categoryType)
  Future<void> deleteCategoriesTypes();

  //StoryCategories
  @POST('${EndPoints.story}{storyId}/${EndPoints.categories}{categoryId}')
  Future<void> createCategoryToStory({
    @Path() required String storyId,
    @Path() required String categoryId,
  });

  @DELETE('${EndPoints.story}{storyId}/${EndPoints.categories}{categoryId}')
  Future<void> deleteCategoryToStory({
    @Path() required String storyId,
    @Path() required String categoryId,
  });

  //StoryPopular
  @PUT('${EndPoints.storyPopular}{storyId}')
  Future<void> updateStoryReads({@Path() required String storyId});

  @GET(EndPoints.storyPopular)
  Future<StoryModel> getStoryPopular({
    @Query('filter') required String? filter, // Period
  });

  @GET(EndPoints.storyPopular)
  Future<List<StoryModel>> getStoriesPopular({
    @Query('filter') required String? filter, // Period
  });

  //Search
  @GET(EndPoints.search)
  Future<List<CategoryModel>> getSearchCategories({
    @Query('query') required String query,
    @Query('type') String type = 'category',
  });

  @GET(EndPoints.search)
  Future<List<StoryModel>> getSearchStories({
    @Query('query') required String query,
    @Query('type') String type = 'story',
  });
}
