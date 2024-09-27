/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/add_rounded.svg
  String get addRounded => 'assets/icons/add_rounded.svg';

  /// File path: assets/icons/back.svg
  String get back => 'assets/icons/back.svg';

  /// File path: assets/icons/calendar.svg
  String get calendar => 'assets/icons/calendar.svg';

  /// File path: assets/icons/camera.svg
  String get camera => 'assets/icons/camera.svg';

  /// File path: assets/icons/checkmark.svg
  String get checkmark => 'assets/icons/checkmark.svg';

  /// File path: assets/icons/checkmarkEmpty.svg
  String get checkmarkEmpty => 'assets/icons/checkmarkEmpty.svg';

  /// File path: assets/icons/clock.svg
  String get clock => 'assets/icons/clock.svg';

  /// File path: assets/icons/close.svg
  String get close => 'assets/icons/close.svg';

  /// File path: assets/icons/contact_book.svg
  String get contactBook => 'assets/icons/contact_book.svg';

  /// File path: assets/icons/edit.svg
  String get edit => 'assets/icons/edit.svg';

  /// File path: assets/icons/location.svg
  String get location => 'assets/icons/location.svg';

  /// File path: assets/icons/menu.svg
  String get menu => 'assets/icons/menu.svg';

  /// File path: assets/icons/more.svg
  String get more => 'assets/icons/more.svg';

  /// File path: assets/icons/tick.svg
  String get tick => 'assets/icons/tick.svg';

  /// File path: assets/icons/trash.svg
  String get trash => 'assets/icons/trash.svg';

  /// File path: assets/icons/user.svg
  String get user => 'assets/icons/user.svg';

  /// List of all assets
  List<String> get values => [
        addRounded,
        back,
        calendar,
        camera,
        checkmark,
        checkmarkEmpty,
        clock,
        close,
        contactBook,
        edit,
        location,
        menu,
        more,
        tick,
        trash,
        user
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/common
  $AssetsImagesCommonGen get common => const $AssetsImagesCommonGen();

  /// Directory path: assets/images/onboarding
  $AssetsImagesOnboardingGen get onboarding =>
      const $AssetsImagesOnboardingGen();
}

class $AssetsImagesCommonGen {
  const $AssetsImagesCommonGen();

  /// File path: assets/images/common/placeholder.png
  AssetGenImage get placeholder =>
      const AssetGenImage('assets/images/common/placeholder.png');

  /// List of all assets
  List<AssetGenImage> get values => [placeholder];
}

class $AssetsImagesOnboardingGen {
  const $AssetsImagesOnboardingGen();

  /// File path: assets/images/onboarding/1.png
  AssetGenImage get a1 => const AssetGenImage('assets/images/onboarding/1.png');

  /// File path: assets/images/onboarding/2.png
  AssetGenImage get a2 => const AssetGenImage('assets/images/onboarding/2.png');

  /// File path: assets/images/onboarding/3.png
  AssetGenImage get a3 => const AssetGenImage('assets/images/onboarding/3.png');

  /// List of all assets
  List<AssetGenImage> get values => [a1, a2, a3];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
