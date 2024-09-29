// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddExpenseRoute.name: (routeData) {
      final args = routeData.argsAs<AddExpenseRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddExpenseScreen(
          key: args.key,
          event: args.event,
          expense: args.expense,
        ),
      );
    },
    AddGuestRoute.name: (routeData) {
      final args = routeData.argsAs<AddGuestRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddGuestScreen(
          key: args.key,
          event: args.event,
          guest: args.guest,
        ),
      );
    },
    AddSubtaskRoute.name: (routeData) {
      final args = routeData.argsAs<AddSubtaskRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddSubtaskScreen(
          key: args.key,
          event: args.event,
          subtask: args.subtask,
        ),
      );
    },
    ArticleDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ArticleDetailsScreen(
          key: args.key,
          article: args.article,
        ),
      );
    },
    ArticlesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ArticlesScreen(),
      );
    },
    CalendarRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CalendarScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    NewEventRoute.name: (routeData) {
      final args = routeData.argsAs<NewEventRouteArgs>(
          orElse: () => const NewEventRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewEventScreen(
          key: args.key,
          event: args.event,
        ),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    OpenEventRoute.name: (routeData) {
      final args = routeData.argsAs<OpenEventRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OpenEventScreen(
          key: args.key,
          event: args.event,
        ),
      );
    },
    PrivacyPolicyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PrivacyPolicyScreen(),
      );
    },
    PrivacyRoute.name: (routeData) {
      final args = routeData.argsAs<PrivacyRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PrivacyScreen(
          key: args.key,
          link: args.link,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    TermsOfUseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TermsOfUseScreen(),
      );
    },
  };
}

/// generated route for
/// [AddExpenseScreen]
class AddExpenseRoute extends PageRouteInfo<AddExpenseRouteArgs> {
  AddExpenseRoute({
    Key? key,
    required Event event,
    Expense? expense,
    List<PageRouteInfo>? children,
  }) : super(
          AddExpenseRoute.name,
          args: AddExpenseRouteArgs(
            key: key,
            event: event,
            expense: expense,
          ),
          initialChildren: children,
        );

  static const String name = 'AddExpenseRoute';

  static const PageInfo<AddExpenseRouteArgs> page =
      PageInfo<AddExpenseRouteArgs>(name);
}

class AddExpenseRouteArgs {
  const AddExpenseRouteArgs({
    this.key,
    required this.event,
    this.expense,
  });

  final Key? key;

  final Event event;

  final Expense? expense;

  @override
  String toString() {
    return 'AddExpenseRouteArgs{key: $key, event: $event, expense: $expense}';
  }
}

/// generated route for
/// [AddGuestScreen]
class AddGuestRoute extends PageRouteInfo<AddGuestRouteArgs> {
  AddGuestRoute({
    Key? key,
    required Event event,
    Guest? guest,
    List<PageRouteInfo>? children,
  }) : super(
          AddGuestRoute.name,
          args: AddGuestRouteArgs(
            key: key,
            event: event,
            guest: guest,
          ),
          initialChildren: children,
        );

  static const String name = 'AddGuestRoute';

  static const PageInfo<AddGuestRouteArgs> page =
      PageInfo<AddGuestRouteArgs>(name);
}

class AddGuestRouteArgs {
  const AddGuestRouteArgs({
    this.key,
    required this.event,
    this.guest,
  });

  final Key? key;

  final Event event;

  final Guest? guest;

  @override
  String toString() {
    return 'AddGuestRouteArgs{key: $key, event: $event, guest: $guest}';
  }
}

/// generated route for
/// [AddSubtaskScreen]
class AddSubtaskRoute extends PageRouteInfo<AddSubtaskRouteArgs> {
  AddSubtaskRoute({
    Key? key,
    required Event event,
    Subtask? subtask,
    List<PageRouteInfo>? children,
  }) : super(
          AddSubtaskRoute.name,
          args: AddSubtaskRouteArgs(
            key: key,
            event: event,
            subtask: subtask,
          ),
          initialChildren: children,
        );

  static const String name = 'AddSubtaskRoute';

  static const PageInfo<AddSubtaskRouteArgs> page =
      PageInfo<AddSubtaskRouteArgs>(name);
}

class AddSubtaskRouteArgs {
  const AddSubtaskRouteArgs({
    this.key,
    required this.event,
    this.subtask,
  });

  final Key? key;

  final Event event;

  final Subtask? subtask;

  @override
  String toString() {
    return 'AddSubtaskRouteArgs{key: $key, event: $event, subtask: $subtask}';
  }
}

/// generated route for
/// [ArticleDetailsScreen]
class ArticleDetailsRoute extends PageRouteInfo<ArticleDetailsRouteArgs> {
  ArticleDetailsRoute({
    Key? key,
    required Article article,
    List<PageRouteInfo>? children,
  }) : super(
          ArticleDetailsRoute.name,
          args: ArticleDetailsRouteArgs(
            key: key,
            article: article,
          ),
          initialChildren: children,
        );

  static const String name = 'ArticleDetailsRoute';

  static const PageInfo<ArticleDetailsRouteArgs> page =
      PageInfo<ArticleDetailsRouteArgs>(name);
}

class ArticleDetailsRouteArgs {
  const ArticleDetailsRouteArgs({
    this.key,
    required this.article,
  });

  final Key? key;

  final Article article;

  @override
  String toString() {
    return 'ArticleDetailsRouteArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [ArticlesScreen]
class ArticlesRoute extends PageRouteInfo<void> {
  const ArticlesRoute({List<PageRouteInfo>? children})
      : super(
          ArticlesRoute.name,
          initialChildren: children,
        );

  static const String name = 'ArticlesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CalendarScreen]
class CalendarRoute extends PageRouteInfo<void> {
  const CalendarRoute({List<PageRouteInfo>? children})
      : super(
          CalendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalendarRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewEventScreen]
class NewEventRoute extends PageRouteInfo<NewEventRouteArgs> {
  NewEventRoute({
    Key? key,
    Event? event,
    List<PageRouteInfo>? children,
  }) : super(
          NewEventRoute.name,
          args: NewEventRouteArgs(
            key: key,
            event: event,
          ),
          initialChildren: children,
        );

  static const String name = 'NewEventRoute';

  static const PageInfo<NewEventRouteArgs> page =
      PageInfo<NewEventRouteArgs>(name);
}

class NewEventRouteArgs {
  const NewEventRouteArgs({
    this.key,
    this.event,
  });

  final Key? key;

  final Event? event;

  @override
  String toString() {
    return 'NewEventRouteArgs{key: $key, event: $event}';
  }
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OpenEventScreen]
class OpenEventRoute extends PageRouteInfo<OpenEventRouteArgs> {
  OpenEventRoute({
    Key? key,
    required Event event,
    List<PageRouteInfo>? children,
  }) : super(
          OpenEventRoute.name,
          args: OpenEventRouteArgs(
            key: key,
            event: event,
          ),
          initialChildren: children,
        );

  static const String name = 'OpenEventRoute';

  static const PageInfo<OpenEventRouteArgs> page =
      PageInfo<OpenEventRouteArgs>(name);
}

class OpenEventRouteArgs {
  const OpenEventRouteArgs({
    this.key,
    required this.event,
  });

  final Key? key;

  final Event event;

  @override
  String toString() {
    return 'OpenEventRouteArgs{key: $key, event: $event}';
  }
}

/// generated route for
/// [PrivacyPolicyScreen]
class PrivacyPolicyRoute extends PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<PageRouteInfo>? children})
      : super(
          PrivacyPolicyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PrivacyScreen]
class PrivacyRoute extends PageRouteInfo<PrivacyRouteArgs> {
  PrivacyRoute({
    Key? key,
    required String link,
    List<PageRouteInfo>? children,
  }) : super(
          PrivacyRoute.name,
          args: PrivacyRouteArgs(
            key: key,
            link: link,
          ),
          initialChildren: children,
        );

  static const String name = 'PrivacyRoute';

  static const PageInfo<PrivacyRouteArgs> page =
      PageInfo<PrivacyRouteArgs>(name);
}

class PrivacyRouteArgs {
  const PrivacyRouteArgs({
    this.key,
    required this.link,
  });

  final Key? key;

  final String link;

  @override
  String toString() {
    return 'PrivacyRouteArgs{key: $key, link: $link}';
  }
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TermsOfUseScreen]
class TermsOfUseRoute extends PageRouteInfo<void> {
  const TermsOfUseRoute({List<PageRouteInfo>? children})
      : super(
          TermsOfUseRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsOfUseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
