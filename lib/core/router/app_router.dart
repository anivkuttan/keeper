import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keeper/src/pages/home_page.dart';
import 'package:keeper/src/pages/main_page.dart';
import 'package:keeper/src/pages/on_boarding_screen.dart';
import 'package:keeper/src/pages/profile_page.dart';
import 'package:keeper/src/pages/sign_in_screen.dart';
import 'package:keeper/src/pages/sign_up_screen.dart';
import 'package:keeper/src/pages/transaction_page.dart';
import 'package:keeper/src/person/view/new_person_creation.dart';
import 'package:keeper/src/person/view/user_list_page.dart';

class AppRouter {
  AppRouter._();

  static GoRouter router = GoRouter(
    initialLocation: AppPage.homeScreen.path,
    routes: [
      // ShellRoute to manage the bottom navigation
      ShellRoute(
        navigatorKey: GlobalKey<NavigatorState>(),
        builder: (context, state, child) {
          return MainScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: AppPage.homeScreen.path,
            name: AppPage.homeScreen.name,
            pageBuilder:
                (context, state) => const MaterialPage(child: HomePage()),
          ),
          GoRoute(
            path: AppPage.transactionScreen.path,
            name: AppPage.transactionScreen.name,
            pageBuilder:
                (context, state) =>
                    const MaterialPage(child: TransactionPage()),
          ),
          GoRoute(
            path: AppPage.budgetScreen.path,
            name: AppPage.budgetScreen.name,
            pageBuilder:
                (context, state) => const MaterialPage(child: UsersPage()),
          ),
          GoRoute(
            path: AppPage.profileScreen.path,
            name: AppPage.profileScreen.name,
            pageBuilder:
                (context, state) => const MaterialPage(child: ProfilePage()),
          ),
        ],
      ),
      GoRoute(
        path: AppPage.onboardingScreen.path,
        name: AppPage.onboardingScreen.name,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: AppPage.signUpScreen.path,
        name: AppPage.signUpScreen.name,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: AppPage.signInScreen.path,
        name: AppPage.signInScreen.name,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: AppPage.newPersonScreen.path,
        name: AppPage.newPersonScreen.name,
        builder: (context, state) {
          return NewPersonPage();
        },
      ),
    ],
  );
}

enum AppPage {
  onboardingScreen(name: 'onboarding', path: '/'),
  signInScreen(name: 'signIn', path: '/signin'),
  signUpScreen(name: 'signUp', path: '/signup'),
  transactionScreen(name: 'transaction', path: '/transaction'),
  budgetScreen(name: 'budget', path: '/budget'),
  profileScreen(name: 'profile', path: '/profile'),
  newPersonScreen(name: 'newPerson', path: '/newPerson'),
  homeScreen(name: 'homePage', path: '/homePage');

  const AppPage({required this.name, required this.path});
  final String name;
  final String path;
}
