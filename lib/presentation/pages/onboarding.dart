import 'dart:developer';

import 'package:timealy/presentation/pages/home_page.dart';

import '../../application/providers/onboarding_provider.dart';

import '../../utils/constants.dart';
import '../core/route_navigator.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatefulWidget {
  static const routeName = 'onboarding';
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController ctrl = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Consumer<OnboardingStateProvider>(builder: (context, obprov, _) {
        return Stack(
          children: [
            PageView(
                controller: ctrl,
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (val) {
                  log('page change called');
                  obprov.setCurrentIndex(val);
                },
                children: List.generate(
                    obprov.pages,
                    (index) => Container(
                          constraints: const BoxConstraints.expand(),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/${index + 1}.png'),
                            ),
                          ),
                        ))),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: ElevatedButton(
                  onPressed: () {
                    // obprov.setNextPage();
                    if (obprov.currentIndex == 2) {
                      RouteNavigator.navigateReplacementWithFade(
                          routeName: MyHomePage.routeName, context: context);
                    }
                    ctrl.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.linear);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: startButtonColor,
                    shape: defaultElevatedButtonShape,
                  ),
                  child: Text(
                    obprov.currentIndex == 2 ? 'Lets dive in' : 'Next',
                    style: buttonTextStyle,
                  ),
                ),
              ),
            ),
            if (obprov.currentIndex > 0)
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // obprov.setNextPage();
                      ctrl.previousPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: startButtonColor,
                      shape: defaultElevatedButtonShape,
                    ),
                    child: Text(
                      obprov.currentIndex == 0 ? '' : 'Back',
                      style: buttonTextStyle,
                    ),
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }
}
