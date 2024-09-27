import 'package:dio/dio.dart';
import 'package:pp_467/features/articles/domain/entities/article/article.dart';
import 'package:pp_467/features/articles/data/article_repo.dart';

class ArticleRepoImpl implements ArticleRepo {
  final Dio dio;
  final String apiUrl;

  ArticleRepoImpl({required this.dio, required this.apiUrl});

  @override
  Future<List<Article>> getAll() async {
    try {
      final response = await dio.get(
          '$apiUrl/everything?q=food&language=en&apiKey=18eda10535a840b89c9e79a4ff7d9b90');

      if (response.statusCode == 200) {
        final List<dynamic> articlesJson = response.data['articles'];

        final List<Article> articles = articlesJson
            .map((json) => Article.fromJson(json as Map<String, dynamic>))
            .toList();

        return articles;
      } else {
        throw Exception('Failed to load articles: ${response.statusCode}');
      }
    } catch (e) {
      return [];
    }
  }
}
