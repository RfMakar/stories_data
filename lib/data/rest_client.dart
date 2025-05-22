import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:stories_data/core/constans.dart';
import 'package:stories_data/core/endpoints.dart';

import '../models/index.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: apiUrl)
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  //Story
  @GET(EndPoints.story)
  Future<List<StoryModel>> getStories();

  @GET('${EndPoints.story}{id}')
  Future<StoryModel> getStory({@Path() required String id});

  @POST(EndPoints.story)
  Future<StoryModel> createStory({
    @Part() required String title,
    @Part() required String content,
    @Part() required File image,
  });

  @PUT('${EndPoints.story}{id}')
  Future<StoryModel> updateStory({
    @Path() required String id,
    @Part() String? title,
    @Part() String? content,
    @Part() File? image,
  });

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
    @Part() required File icon,
  });

  @PUT('${EndPoints.category}{id}')
  Future<CategoryModel> updateCategory({
    @Path() required String id,
    @Part() String? name,
    @Part() File? icon,
  });

  @DELETE('${EndPoints.category}{id}')
  Future<void> deleteCategory({@Path() required String id});

  @DELETE(EndPoints.category)
  Future<void> deleteCategories();
}
