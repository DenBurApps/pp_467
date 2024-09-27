import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/services/image_service.dart';
import 'package:pp_467/core/ui_kit/custom_button.dart';
import 'package:pp_467/core/ui_kit/section.dart';
import 'package:pp_467/core/ui_kit/svg_icon.dart';
import 'package:pp_467/features/events/presentation/new_event/photo/photo_inh_widget.dart';
import 'package:pp_467/gen/assets.gen.dart';

class PhotoContent extends StatelessWidget {
  final String submitButtonTitle;
  final VoidCallback submitButtonCallback;
  const PhotoContent({
    super.key,
    required this.submitButtonTitle,
    required this.submitButtonCallback,
  });

  @override
  Widget build(BuildContext context) {
    final inherited = PhotoContentInheritedWidget.of(context);
    if (inherited == null) return const SizedBox.shrink();
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: inherited.image == null
                      ? () async {
                          final image = await ImageService.pickImage(context);
                          if (image != null) {
                            inherited.onUpdated(image);
                          }
                        }
                      : null,
                  child: AnimatedContainer(
                    duration: Durations.medium1,
                    height: MediaQuery.of(context).size.width - 20,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(color: context.colors.primary),
                      borderRadius: BorderRadius.circular(20),
                      image: inherited.image != null
                          ? DecorationImage(
                              image: FileImage(File(inherited.image!.path)),
                              fit: BoxFit.cover)
                          : null,
                    ),
                    child: inherited.image == null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgIcon(Assets.icons.camera),
                              const SizedBox(width: 10),
                              Text(
                                'Add photo',
                                style: context.text.bodyMedium,
                              ),
                            ],
                          )
                        : null,
                  ),
                ),
              ),
              if (inherited.image != null)
                Align(
                  alignment: Alignment.topRight,
                  child: CupertinoButton(
                    minSize: 0,
                    padding: EdgeInsets.zero,
                    onPressed: inherited.onCleared,
                    child: SvgIcon(
                      Assets.icons.close,
                      side: 36,
                    ),
                  ),
                ),
            ],
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 56),
              child: Section(
                child: CustomButton.title(
                  title: submitButtonTitle,
                  onPressed: submitButtonCallback,
                  active: inherited.image != null,
                  color: context.colors.primary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
