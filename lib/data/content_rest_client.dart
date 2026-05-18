import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:stories_data/core/constans.dart';
import 'package:stories_data/core/endpoints.dart';

import '../models/index.dart';



part 'content_rest_client.g.dart';

@RestApi(baseUrl: contentApiUrl)
abstract class ContentRestClient {
  factory ContentRestClient(Dio dio) = _ContentRestClient;

  @POST(ContentEndPoints.generateText)
  Future<GenerateTextResponse> generateText(
    @Body() GenerateTextRequest request,
  );

  @POST(ContentEndPoints.generateImage)
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> generateImage(
    @Body() GenerateImageRequest request,
  );

  @POST(ContentEndPoints.generateAudio)
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> generateAudio(
    @Body() GenerateAudioRequest request,
  );
}