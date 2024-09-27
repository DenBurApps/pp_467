import 'package:pp_467/features/articles/domain/entities/article/article.dart';

abstract class ArticleRepo {
  Future<List<Article>> getAll();
}
