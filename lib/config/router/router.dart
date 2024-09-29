import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:pp_467/features/articles/domain/entities/article/article.dart';
import 'package:pp_467/features/articles/presentation/article_details_screen.dart';
import 'package:pp_467/features/articles/presentation/articles_screen.dart';
import 'package:pp_467/features/events/domain/entities/event/event.dart';
import 'package:pp_467/features/events/domain/entities/expense/expense.dart';
import 'package:pp_467/features/events/domain/entities/guest/guest.dart';
import 'package:pp_467/features/events/domain/entities/subtask/subtask.dart';
import 'package:pp_467/features/events/presentation/calendar_screen.dart';
import 'package:pp_467/features/events/presentation/home_screen.dart';
import 'package:pp_467/features/events/presentation/new_event/new_event_screen.dart';
import 'package:pp_467/features/events/presentation/open_event/screens/add_expense_screen.dart';
import 'package:pp_467/features/events/presentation/open_event/screens/add_guest_screen.dart';
import 'package:pp_467/features/events/presentation/open_event/screens/add_subtask_screen.dart';
import 'package:pp_467/features/events/presentation/open_event/screens/open_event_screen.dart';
import 'package:pp_467/features/onboarding/onboarding_screen.dart';
import 'package:pp_467/features/settings/screens/privacy_policy_screen.dart';
import 'package:pp_467/features/settings/screens/privacy_screen.dart';
import 'package:pp_467/features/settings/screens/settings_screen.dart';
import 'package:pp_467/features/settings/screens/splash_screen.dart';
import 'package:pp_467/features/settings/screens/terms_of_use_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: PrivacyRoute.page),
        AutoRoute(page: PrivacyPolicyRoute.page),
        AutoRoute(page: TermsOfUseRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: AddExpenseRoute.page),
        AutoRoute(page: AddGuestRoute.page),
        AutoRoute(page: AddSubtaskRoute.page),
        AutoRoute(page: OpenEventRoute.page),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ArticlesRoute.page),
        AutoRoute(page: CalendarRoute.page),
        AutoRoute(page: NewEventRoute.page),
        AutoRoute(page: ArticleDetailsRoute.page),
      ];
}
