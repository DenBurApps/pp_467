import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pp_467/config/router/router.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/ui_kit/app_background.dart';
import 'package:pp_467/core/ui_kit/custom_button.dart';
import 'package:pp_467/gen/assets.gen.dart';
import '../../core/ui_kit/section.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final onboardingPages = <Widget>[
      Section(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Welcome!',
                style: context.text.displayLarge,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.images.onboarding.a1.path,
                  width: size.width,
                ),
                const SizedBox(height: 10),
                Text(
                  'It is your perfect assistant for event planning. Manage your events easily and enjoyably with our simple tools!',
                  style: context.text.bodyLarge,
                ),
              ],
            ),
          ],
        ),
      ),
      Section(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Key Features',
                style: context.text.displayLarge,
              ),
            ),
            Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.images.onboarding.a2.path,
                    height: size.height * .4,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '•',
                        style: context.text.bodyLarge,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Create and manage events in a couple of clicks.',
                          style: context.text.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '•',
                        style: context.text.bodyLarge,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Plan tasks and keep track of their fulfillment.',
                          style: context.text.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '•',
                        style: context.text.bodyLarge,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Manage your guest list and rest assured that everything is under control.',
                          style: context.text.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Section(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Let\'s get\nstarted!',
                style: context.text.displayLarge,
                textAlign: TextAlign.center,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.images.onboarding.a3.path),
                const SizedBox(height: 10),
                Text(
                  'Start planning your next event today! With this app everything will be perfectly organized.',
                  style: context.text.bodyLarge,
                ),
              ],
            ),
            const SizedBox(height: 85),
          ],
        ),
      ),
    ];
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: onboardingPages,
                ),
              ),
              Section(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: CustomButton.title(
                      title: _currentPage != onboardingPages.length - 1
                          ? 'Next'
                          : 'Start',
                      onPressed: () {
                        if (_currentPage != onboardingPages.length - 1) {
                          setState(() {
                            _pageController.nextPage(
                              duration: Durations.medium1,
                              curve: Curves.easeInOutCubicEmphasized,
                            );
                            ++_currentPage;
                          });
                        } else {
                          context.router.replace(const HomeRoute());
                        }
                      },
                      active: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
