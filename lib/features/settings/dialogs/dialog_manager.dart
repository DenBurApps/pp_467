import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../config/router/router.dart';
import 'contact_dialog.dart';

class DialogManager {
  static showAppVersionDialog(BuildContext context) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final appName = packageInfo.appName;
    final version = packageInfo.version;
    String running = '';
    String model = '';

    if (Platform.isAndroid) {
      AndroidDeviceInfo andInfo = await deviceInfo.androidInfo;
      running = 'Android ${andInfo.version.release}';
      model = andInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      running = iosInfo.utsname.machine;
      model = iosInfo.model;
    }
    if (context.mounted) {
      await showCupertinoDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => CupertinoAlertDialog(
          title: Text(appName),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Running on: $running'),
              const SizedBox(height: 8),
              Text('Model: $model'),
              const SizedBox(height: 8),
              Text('Version: $version'),
            ],
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: Navigator.of(context).pop,
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  static Future<void> showNoInternetDialog(BuildContext context) async =>
      await showCupertinoDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('No Internet Connection'),
          content: const Text(
              'You have lost your internet connection. Please check your settings and try again.'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () {
                context.router
                  ..popForced()
                  ..pushAndPopUntil(
                    const SplashRoute(),
                    predicate: (_) => true,
                  );
              },
            ),
          ],
        ),
      );
  static showContactDialog(BuildContext context) {
    return showCupertinoDialog(
      context: context,
      builder: (context) => const ContactDialog(),
    );
  }

  static Future<bool?> deleteConfirmationDialog(BuildContext context) {
    return showCupertinoDialog<bool>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('This action is irreversible'),
        actions: [
          CupertinoDialogAction(
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => context.router.popForced(false),
          ),
          CupertinoDialogAction(
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () => context.router.popForced(true),
          ),
        ],
      ),
    );
  }
}
