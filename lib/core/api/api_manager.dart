import 'package:dio/dio.dart';
import 'package:news_app/core/api/api_constants.dart';
import 'package:news_app/core/api/api_key.dart';
import 'package:news_app/models/sources/sources_response.dart';

class ApiManager {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
    ),
  );

  static Future<SourcesResponse> getSources(String category) async {
    var response = await dio.get(
      ApiConstants.sorcesEndpoint,
      queryParameters: {
        'category': category,
      },
      options: Options(
        headers: {
          'Authorization': ApiKey.apiKey,
        },
      ),
    );
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(response.data);
    return sourcesResponse;
  }
}
