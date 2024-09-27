import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoContentInheritedWidget extends InheritedWidget {
  final XFile? image;
  final Function(XFile) onUpdated;
  final VoidCallback onCleared;

  const PhotoContentInheritedWidget({
    super.key,
    required super.child,
    required this.image,
    required this.onUpdated,
    required this.onCleared,
  });

  static PhotoContentInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<PhotoContentInheritedWidget>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
