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
      final headers = {
        'Content-Type': 'application/json',
        'x-rapidapi-host': 'google-api31.p.rapidapi.com',
        'x-rapidapi-key': '9af998eef9mshb85ffefb063e6b2p1f2bbajsn433e24a36cdd',
      };

      final data = {
        'text':
            'holiday party OR celebration OR festivity OR happy event -political -government -election',
        'region': 'wt-wt',
        'max_results': 25,
      };

      final response = await dio.post(
        apiUrl,
        data: data,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        final List<dynamic> articlesJson = response.data['news'];

        final List<Article> articles = articlesJson
            .map((json) => Article.fromJson(json as Map<String, dynamic>))
            .toList();
        return articles;
      } else {
        throw Exception('Failed to load articles: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load articles: $e');
    }
  }
}
