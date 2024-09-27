import 'package:pp_467/features/articles/domain/entities/article/article.dart';

class NewsResponse {
  final String status;
  final int totalResults;
  final List<Article> articles;

  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      status: json['status'],
      totalResults: json['totalResults'] ?? 0,
      articles: (json['articles'] as List)
          .map((articleJson) => Article.fromJson(articleJson))
          .toList(),
    );
  }
}
