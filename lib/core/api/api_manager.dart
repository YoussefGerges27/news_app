import 'package:dio/dio.dart';
import 'package:news_app/core/api/api_constants.dart';
import 'package:news_app/core/api/api_key.dart';
import 'package:news_app/models/articles/articles_response.dart';
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

  static Future<ArticlesResponse> getArticles(String source) async {
    var response = await dio.get(
      ApiConstants.everythingEndpoint,
      queryParameters: {
        'sources': source,
      },
      options: Options(
        headers: {
          'Authorization': ApiKey.apiKey,
        },
      ),
    );
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(
      response.data,
    );
    return articlesResponse;
  }
}
