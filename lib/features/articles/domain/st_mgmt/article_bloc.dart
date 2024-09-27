import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pp_467/features/articles/data/article_repo.dart';
import 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleRepo repo;

  ArticleBloc({required this.repo}) : super(const ArticleState.loading()) {
    on<LoadArticlesEvent>((event, emit) async {
      emit(const ArticleState.loading());
      try {
        final articles = await repo.getAll();
        emit(
          ArticleState.loaded(
            articles
              ..sort(
                (a, b) => DateTime.parse(b.date).compareTo(
                  DateTime.parse(a.date),
                ),
              ),
          ),
        );
      } catch (e) {
        emit(ArticleState.error(e.toString()));
      }
    });
  }
}

abstract class ArticleEvent {}

class LoadArticlesEvent extends ArticleEvent {}
