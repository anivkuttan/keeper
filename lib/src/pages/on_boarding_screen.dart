import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keeper/core/const/app_image.dart';
import 'package:keeper/core/router/app_router.dart';
import 'package:keeper/core/shared/widgets/app_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final List<OnBoardingModal> pages;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    pages = [
      OnBoardingModal(
        title: 'Gain total control of your money',
        description: 'Become your own money manager and make every cent count',
        imageUrl: AppImage.onBoardingImage1,
      ),
      OnBoardingModal(
        title: 'Know where your money goes',
        description:
            'Track your transaction easily, with categories and financial report',
        imageUrl: AppImage.onBoardingImage2,
      ),
      OnBoardingModal(
        title: 'Planning ahead',
        description:
            'Setup your budget for each category so you are in control',
        imageUrl: AppImage.onBoardingImage3,
      ),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              controller: _pageController,
              itemCount: pages.length,
              itemBuilder: (context, index) {
                final data = pages[index];
                return Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: Image.asset(data.imageUrl)),
                      Text(
                        data.title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(data.description, textAlign: TextAlign.center),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: pages.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Theme.of(context).primaryColor,
                      dotColor: Colors.grey,
                      dotHeight: 10,
                      dotWidth: 10,
                      expansionFactor: 3,
                      spacing: 8.0,
                    ),
                  ),
                  Spacer(),
                  AppButton(
                    title: 'Sign Up',
                    onTap: () {
                      context.push(AppPage.signUpScreen.path);
                    },
                  ),
                  Spacer(),
                  AppButton.secondry(
                    title: 'Sign In',
                    onTap: () {
                      context.push(AppPage.signInScreen.path);
                    },
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoardingModal {
  final String title;
  final String description;
  final String imageUrl;
  const OnBoardingModal({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}
