import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keeper/core/db/database.dart';
import 'package:keeper/core/di/di.dart';
import 'package:keeper/src/login/modal/repo/login_local.dart';
import 'package:keeper/src/login/view/sign_in_screen.dart';
import 'package:keeper/src/login/view/sign_up_screen.dart';
import 'package:keeper/src/pages/home_page.dart';
import 'package:keeper/src/pages/main_page.dart';
import 'package:keeper/src/pages/on_boarding_screen.dart';
import 'package:keeper/src/pages/profile_page.dart';
import 'package:keeper/src/transaction/view/pages/transaction_page.dart';
import 'package:keeper/src/person/model/person.dart';
import 'package:keeper/src/person/view/new_person_creation.dart';
import 'package:keeper/src/person/view/person_details.dart';
import 'package:keeper/src/person/view/person_list_page.dart';
import 'package:keeper/src/transaction/view/pages/transaction_view_page.dart';

class AppRouter {
  AppRouter._();

  static GoRouter router = GoRouter(
    initialLocation: AppPage.onboardingScreen.path,
    redirect: (context, state) async {
      final isUserLoggedIn = await getIt<LoginLocal>().isLogined();

      // If the user is not logged in, allow onboarding and login/signup
      final isAuthPages =
          state.matchedLocation == AppPage.signInScreen.path ||
          state.matchedLocation == AppPage.signUpScreen.path ||
          state.matchedLocation == AppPage.onboardingScreen.path;
      final isDb = state.matchedLocation == AppPage.db.path;
      if (isDb) {
        return AppPage.db.path;
      }
      if (!isUserLoggedIn) {
        // If trying to access other pages while not logged in, redirect to onboarding
        if (!isAuthPages) {
          return AppPage.onboardingScreen.path;
        }
      } else {
        // If already logged in, prevent visiting onboarding or login pages
        if (isAuthPages) {
          return AppPage.homeScreen.path;
        }
      }

      // No redirect needed
      return null;
    },
    routes: [
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
      GoRoute(
        path: AppPage.personDetails.path,
        name: AppPage.personDetails.name,
        builder: (context, state) {
          final person = state.extra as Person;
          return ProfileScreen(person: person);
        },
      ),
      GoRoute(
        path: AppPage.transactionViewScreen.path,
        name: AppPage.transactionViewScreen.name,
        builder: (context, state) {
          return TransactionDetailPage();
        },
      ),
      GoRoute(
        path: AppPage.db.path,
        name: AppPage.db.name,
        builder: (context, state) {
          return DriftDbViewer(getIt<AppDatabase>());
        },
      ),
    ],
  );
}

enum AppPage {
  onboardingScreen(name: 'onboarding', path: '/'),
  signInScreen(name: 'signIn', path: '/sign-in'),
  signUpScreen(name: 'signUp', path: '/sign-up'),
  transactionScreen(name: 'transaction', path: '/transaction'),
  budgetScreen(name: 'budget', path: '/budget'),
  profileScreen(name: 'profile', path: '/profile'),
  newPersonScreen(name: 'newPerson', path: '/newPerson'),
  personDetails(name: 'personDetails', path: '/personDetails'),
  transactionViewScreen(
    name: 'transactionViewScreen',
    path: '/transactionViewScreen',
  ),
  homeScreen(name: 'homePage', path: '/homePage'),
  // removre this in production
  db(name: 'db', path: '/db');

  const AppPage({required this.name, required this.path});
  final String name;
  final String path;
}
