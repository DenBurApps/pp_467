import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pp_467/features/articles/domain/entities/article/article.dart';

part 'article_state.freezed.dart';

@freezed
class ArticleState with _$ArticleState {
  const factory ArticleState.loading() = ArticleLoading;
  const factory ArticleState.loaded(List<Article> articles) = ArticleLoaded;
  const factory ArticleState.error(String message) = ArticleError;
}
