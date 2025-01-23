import 'package:flutter/material.dart';
import 'package:kinject/kinject.dart';

import 'app_kinject_observer.dart';
import 'onboarding_page.dart';

void main() {
  Kinject.observer = AppKinjectObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnboardingPage(),
    );
  }
}
