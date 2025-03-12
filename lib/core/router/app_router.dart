import 'package:go_router/go_router.dart';
import 'package:keeper/pages/on_boarding_screen.dart';
import 'package:keeper/pages/sign_in_screen.dart';
import 'package:keeper/pages/sign_up_screen.dart';

class AppRouter {
  AppRouter._();
  static GoRouter router = GoRouter(
    initialLocation: AppPage.onboarding.path,
    routes: [
      GoRoute(
        path: AppPage.onboarding.path,
        name: AppPage.onboarding.name,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: AppPage.signUp.path,
        name: AppPage.signUp.name,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: AppPage.signIn.path,
        name: AppPage.signIn.name,
        builder: (context, state) => const SignInScreen(),
      ),
    ],
  );
}

enum AppPage {
  onboarding(name: 'onboarding', path: '/'),
  signIn(name: 'signIn', path: '/signin'),
  signUp(name: 'signUp', path: '/signup');

  const AppPage({required this.name, required this.path});
  final String name;
  final String path;
}
