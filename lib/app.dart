import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_screen.dart';
import 'package:konnek_flutter/konnek_flutter.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String appTitle = "App Sample Flutter - Konnek";
  void handlerAppTitle() {
    if (EnvironmentConfig.flavor == Flavor.development) {
      appTitle = "App Sample Flutter Konnek - Development";
    } else if (EnvironmentConfig.flavor == Flavor.staging) {
      appTitle = "App Sample Flutter Konnek - Staging";
    } else {
      appTitle = "App Sample Flutter Konnek";
    }
  }

  @override
  void initState() {
    handlerAppTitle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: appTitle),
    );
  }
}
