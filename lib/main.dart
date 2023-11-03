import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timealy/application/providers/home_page_provider.dart';
import 'package:timealy/application/providers/onboarding_provider.dart';
import 'package:timealy/application/providers/tick_state_provider.dart';
import 'package:timealy/presentation/pages/onboarding.dart';

import 'presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => TickStateProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => HomePageProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => OnboardingStateProvider(),
          ),
        ],
        child: MaterialApp(
          title: 'Timealy',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: OnboardingPage(),
        ));
  }
}
