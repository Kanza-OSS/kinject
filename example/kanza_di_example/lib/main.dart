import 'package:flutter/material.dart';
import 'package:kanza_di/kanza_di.dart';
import 'package:kanza_di_example/app_kinject_observer.dart';
import 'package:kanza_di_example/login_page.dart';

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
      home: const LoginPage(),
    );
  }
}
