import 'article.dart';

class ArticlesResponse {
  String? status;
  String? code;
  String? message;
  int? totalResults;
  List<Article>? articles;

  ArticlesResponse({
    this.status,
    this.totalResults,
    this.articles,
    this.code,
    this.message,
  });

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) {
    return ArticlesResponse(
      status: json['status'] as String?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'totalResults': totalResults,
    'code': code,
    'message': message,
    'articles': articles?.map((e) => e.toJson()).toList(),
  };
}
