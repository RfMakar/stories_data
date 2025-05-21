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
