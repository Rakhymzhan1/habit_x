import 'package:flutter/material.dart';
import 'package:habit_x/screens/onboarding_tarifs.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _pageController = PageController();

  _onNextPage() {
    if(_pageController.page == 2) {
      Navigator.push(context, OnboardingTarifs.route);
      return;
    }
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: _onNextPage,
          child: const Icon(Icons.arrow_forward, weight: 3, size: 30),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    count: 3,
                    controller: _pageController,
                    effect: ExpandingDotsEffect(
                      dotColor: Theme.of(context).colorScheme.primary,
                      expansionFactor: 2,
                      activeDotColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  GestureDetector(
                    onTap:
                        () => _pageController.animateToPage(
                          2,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        ),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: _page1Content(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _page2Content(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _page3Content(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _page1Content() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 60),
        Text('Welcome to', style: headerTextStyle(context)),
        Text(
          'HabitX',
          style: headerTextStyle(context).copyWith(fontWeight: FontWeight.w600),
        ),
        Expanded(child: SizedBox()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already using HabitX account?',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Login',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 80),
      ],
    );
  }

  Widget _page2Content() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 60),
        Text(
          'A Timeline of',
          style: headerTextStyle(context).copyWith(fontWeight: FontWeight.w600),
        ),
        Text('your day', style: headerTextStyle(context)),
        SizedBox(height: 5),
        Text(
          'All events, to-dos and notes in one place.',
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _page3Content() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 60),
        Text(
          'HabitX',
          style: headerTextStyle(context).copyWith(fontWeight: FontWeight.w600),
        ),
        Text('helps you...', style: headerTextStyle(context)),
        SizedBox(height: 30),
        rowWithData(text: 'Stay focused and \ndistraction-free'),
        rowWithData(text: 'keep control on busy days'),
        rowWithData(text: 'achieve your goals in the\nlong haul'),
      ],
    );
  }

   rowWithData({required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20,),
      child: Row(
          children: [
           // Container(color: Colors.white, height: 60, width: 60, margin: EdgeInsets.all(20),),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
    );
  }

  headerTextStyle(context) => TextStyle(
    height: 1.0,
    color: Theme.of(context).colorScheme.primary,
    fontSize: 36,
    fontWeight: FontWeight.w400,
  );
}
