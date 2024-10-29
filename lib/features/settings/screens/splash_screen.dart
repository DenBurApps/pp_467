import 'dart:async';
import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:pp_467/core/services/config_service.dart';
import '../../../config/router/router.dart';
import '../dialogs/dialog_manager.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _checkConnectivity(
        () async => await DialogManager.showNoInternetDialog(context),
      );
      _navigate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }

  Future<void> _checkConnectivity(Future<void> Function() callback) async {
    final connectivity = Connectivity();
    late List<ConnectivityResult> result;
    try {
      result = await connectivity.checkConnectivity();
      if (result.contains(ConnectivityResult.none)) {
        await callback.call();
        return;
      }
    } on PlatformException catch (e) {
      log('Couldn\'t check connectivity status', error: e);
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }
  }

  Future<void> _navigate() async {
    final router = context.router;
    final configService = context.read<ConfigService>();
    final usePrivacy = configService.usePrivacy;
    final link = configService.link;
    // TODO uncomment upon building
    // late bool usePrivacy = true;
    // const link = 'https://yandex.ru';
    // TODO delete upon building
    await IsFirstRun.isFirstRun().then(
      (isFirstRun) {
        if (isFirstRun) {
          InAppReview.instance.requestReview();
        }
        if (usePrivacy) {
          if (isFirstRun) {
            router.replace(const OnboardingRoute());
          } else {
            router.replace(const HomeRoute());
          }
        } else {
          router.replace(PrivacyRoute(link: link));
        }

        FlutterNativeSplash.remove();
      },
    );
  }
}
