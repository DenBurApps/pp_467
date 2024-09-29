import 'dart:developer';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ImageService {
  late String _appDirPath;

  Future<void> init() async {
    try {
      final Directory appDir = await getApplicationDocumentsDirectory();
      _appDirPath = appDir.path;
      log('App directory initialized at $_appDirPath');
    } catch (e) {
      log('Failed to initialize app directory: $e');
    }
  }

  Future<String?> saveImage(XFile imageFile) async {
    try {
      final String imageName = basename(imageFile.path);
      final String newImagePath = join(_appDirPath, imageName);
      await imageFile.saveTo(newImagePath);
      return imageName;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<bool> deleteImage(String imageName) async {
    try {
      final String imageBasename = basename(imageName);
      final String path = join(_appDirPath, imageBasename);
      final File imageFile = File(path);
      if (await imageFile.exists()) {
        await imageFile.delete();
        return true;
      }
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  File loadImage(String imageName) {
    final String path = join(_appDirPath, imageName);
    return File(path);
  }

  static Future<XFile?> pickImage(BuildContext context) async {
    return showCupertinoModalPopup<XFile?>(
      context: context,
      builder: (context) {
        final router = context.router;
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () async {
                final ImagePicker picker = ImagePicker();
                final XFile? image =
                    await picker.pickImage(source: ImageSource.camera);
                router.popForced(image);
              },
              child: const Text('Camera'),
            ),
            CupertinoActionSheetAction(
              onPressed: () async {
                final ImagePicker picker = ImagePicker();
                final XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);
                router.popForced(image);
              },
              child: const Text('Photos'),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => context.router.popForced(),
            child: const Text('Cancel'),
          ),
        );
      },
    );
  }
}
