import 'package:flutter/material.dart';
import 'package:timealy/presentation/pages/home_page.dart';

Map<String, Widget> routeNameAndWidget = {
  MyHomePage.routeName: WillPopScope(
      onWillPop: () => Future.sync(() => false), child: const MyHomePage()),
};

class RouteNavigator {
  static Route _buildFadeRoute(String routeName) {
    return PageRouteBuilder(
      pageBuilder: ((context, animation, secondaryAnimation) =>
          routeNameAndWidget[routeName]!),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        var curve = Curves.easeIn;
        final curveTween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final opacityAnimation = animation.drive(curveTween);
        return FadeTransition(opacity: opacityAnimation, child: child);
      },
    );
  }

  static void navigateReplacementWithFade(
      {required String routeName, required BuildContext context}) {
    Navigator.of(context).pushReplacement(_buildFadeRoute(routeName));
  }
}
