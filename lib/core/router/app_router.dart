import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keeper/src/pages/home_page.dart';
import 'package:keeper/src/pages/main_page.dart';
import 'package:keeper/src/pages/on_boarding_screen.dart';
import 'package:keeper/src/pages/profile_page.dart';
import 'package:keeper/src/pages/sign_in_screen.dart';
import 'package:keeper/src/pages/sign_up_screen.dart';
import 'package:keeper/src/pages/transaction_page.dart';
import 'package:keeper/src/person/model/person.dart';
import 'package:keeper/src/person/view/new_person_creation.dart';
import 'package:keeper/src/person/view/person_details.dart';
import 'package:keeper/src/person/view/person_list_page.dart';
import 'package:keeper/src/transaction/view/pages/transaction_view_page.dart';

class AppRouter {
  AppRouter._();

  static GoRouter router = GoRouter(
    initialLocation: AppPage.onboardingScreen.path,
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
        // redirect: (context, state) {
        //   final container = ProviderScope.containerOf(context, listen: false);
        //   final isUserLoggedIn = container.read(personProvider).isUserLoggedIn;

        //   // If user is NOT logged in, redirect them to Sign-In page (except if already there)
        //   if (!isUserLoggedIn &&
        //       state.matchedLocation != AppPage.signInScreen.path) {
        //     return AppPage.signInScreen.path;
        //   }

        //   // If user IS logged in and tries to access Sign-In, redirect them to Home
        //   if (isUserLoggedIn &&
        //       state.matchedLocation == AppPage.signInScreen.path) {
        //     return AppPage.homeScreen.path;
        //   }

        //   return null; // No redirection needed
        // },
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
  homeScreen(name: 'homePage', path: '/homePage');

  const AppPage({required this.name, required this.path});
  final String name;
  final String path;
}
