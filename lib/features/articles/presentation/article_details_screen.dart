import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/helpers/format_helper.dart';
import 'package:pp_467/core/ui_kit/custom_back_button.dart';
import 'package:pp_467/core/ui_kit/section.dart';
import 'package:pp_467/features/articles/domain/entities/article/article.dart';

@RoutePage()
class ArticleDetailsScreen extends StatelessWidget {
  final Article article;
  const ArticleDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surfaceBright,
      appBar: AppBar(
        toolbarHeight: 80,
        leading: const CustomBackButton(),
        title: Text(
          'Article Details',
          style: context.text.bodyMedium,
        ),
        centerTitle: true,
      ),
      body: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: context.colors.surfaceDim,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Hero(
                    tag: article.url,
                    child: CachedNetworkImage(
                      imageUrl: article.image,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      imageBuilder: (context, imageProvider) => Container(
                        height: 190,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20)),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => const SizedBox.shrink(),
                      errorWidget: (context, url, error) =>
                          const SizedBox.shrink(),
                    ),
                  ),
                  Section(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 56),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article.title,
                            style: context.text.displayMedium,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                FormatHelper.formatDate(
                                    DateTime.parse(article.date)),
                                style: context.text.bodyMedium,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  article.source,
                                  style: context.text.bodyMedium,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            article.body,
                            style: context.text.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
