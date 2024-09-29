import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/ui_kit/custom_back_button.dart';
import 'package:pp_467/core/ui_kit/section.dart';
import 'package:pp_467/features/articles/domain/st_mgmt/article_bloc.dart';
import 'package:pp_467/features/articles/domain/st_mgmt/article_state.dart';
import 'package:pp_467/features/articles/presentation/article_card.dart';

@RoutePage()
class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ArticleBloc>().add(LoadArticlesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surfaceBright,
      appBar: AppBar(
        toolbarHeight: 80,
        leading: const CustomBackButton(),
        title: Text(
          'Articles',
          style: context.text.bodyMedium,
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: context.colors.surfaceDim,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: CustomScrollView(
          slivers: [
            BlocBuilder<ArticleBloc, ArticleState>(
              builder: (context, state) => switch (state) {
                ArticleLoading _ => const SliverFillRemaining(
                    hasScrollBody: false,
                    child: CupertinoActivityIndicator(
                      radius: 20,
                    ),
                  ),
                ArticleError errorState => SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Section(
                        child: Text(
                          errorState.message,
                          style: context.text.displaySmall.copyWith(
                            color: context.colors.onSurface,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ArticleLoaded loadedState => SliverPadding(
                    padding: const EdgeInsets.only(top: 30, bottom: 56),
                    sliver: SliverList.separated(
                      itemBuilder: (context, index) {
                        final article = loadedState.articles[index];
                        return ArticleCard(article: article);
                      },
                      itemCount: loadedState.articles.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 15),
                    ),
                  ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
