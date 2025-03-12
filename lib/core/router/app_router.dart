import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keeper/pages/home_page.dart';
import 'package:keeper/pages/main_page.dart';
import 'package:keeper/pages/on_boarding_screen.dart';
import 'package:keeper/pages/profile_page.dart';
import 'package:keeper/pages/sign_in_screen.dart';
import 'package:keeper/pages/sign_up_screen.dart';
import 'package:keeper/pages/transaction_page.dart';
import 'package:keeper/pages/user_page.dart';

class AppRouter {
  AppRouter._();

  static GoRouter router = GoRouter(
    initialLocation: AppPage.homePage.path,
    routes: [
      // ShellRoute to manage the bottom navigation
      ShellRoute(
        navigatorKey: GlobalKey<NavigatorState>(),
        builder: (context, state, child) {
          return MainScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: AppPage.homePage.path,
            name: AppPage.homePage.name,
            pageBuilder:
                (context, state) => const MaterialPage(child: HomePage()),
          ),
          GoRoute(
            path: AppPage.transaction.path,
            name: AppPage.transaction.name,
            pageBuilder:
                (context, state) =>
                    const MaterialPage(child: TransactionPage()),
          ),
          GoRoute(
            path: AppPage.budget.path,
            name: AppPage.budget.name,
            pageBuilder:
                (context, state) => const MaterialPage(child: UsersPage()),
          ),
          GoRoute(
            path: AppPage.profile.path,
            name: AppPage.profile.name,
            pageBuilder:
                (context, state) => const MaterialPage(child: ProfilePage()),
          ),
        ],
      ),
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
  onboarding(name: 'onboarding', path: '/s'),
  signIn(name: 'signIn', path: '/signin'),
  signUp(name: 'signUp', path: '/signup'),
  transaction(name: 'transaction', path: '/transaction'),
  budget(name: 'budget', path: '/budget'),
  profile(name: 'profile', path: '/profile'),
  homePage(name: 'homePage', path: '/');

  const AppPage({required this.name, required this.path});
  final String name;
  final String path;
}
