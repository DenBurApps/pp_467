import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pp_467/config/router/router.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/ui_kit/section.dart';
import 'package:pp_467/features/articles/domain/entities/article/article.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Section(
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () =>
            context.router.push(ArticleDetailsRoute(article: article)),
        child: Container(
          decoration: BoxDecoration(
            color: context.colors.onSurface,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              AnimatedSize(
                alignment: Alignment.topCenter,
                duration: Durations.medium1,
                child: Hero(
                  tag: article.url,
                  child: CachedNetworkImage(
                    imageUrl: article.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    imageBuilder: (context, imageProvider) => Container(
                      height: 120,
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
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: context.text.displaySmall.copyWith(
                        color: context.colors.onPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      article.body,
                      style: context.text.bodyMedium.copyWith(
                        color: context.colors.onPrimary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
