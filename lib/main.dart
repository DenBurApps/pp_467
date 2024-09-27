import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pp_467/application.dart';
import 'package:pp_467/core/services/database_service.dart';
import 'package:pp_467/core/services/image_service.dart';
import 'package:pp_467/features/articles/data/article_repo_impl.dart';
import 'package:pp_467/features/events/data/event_repo_impl.dart';
import 'package:pp_467/features/articles/domain/st_mgmt/article_bloc.dart';
import 'package:pp_467/features/events/domain/st_mgmt/event_cubit.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  // await FirebaseService().init();
  // final remoteConfigService = RemoteConfigService();
  // await remoteConfigService.init();

  final databaseService = DatabaseService();
  await databaseService.init();

  final imageService = ImageService();
  await imageService.init();

  final eventRepo = EventRepoImpl(databaseService.events);
  final articleRepo = ArticleRepoImpl(
    dio: Dio(),
    apiUrl: 'https://google-api31.p.rapidapi.com/',
  );

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => databaseService),
        RepositoryProvider(create: (context) => imageService),
        // RepositoryProvider(create: (context) => remoteConfigService),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => EventCubit(
              repo: eventRepo,
              imageService: imageService,
            ),
          ),
          BlocProvider(
            create: (context) => ArticleBloc(
              repo: articleRepo,
            ),
          ),
        ],
        child: Application(),
      ),
    ),
  );
}
