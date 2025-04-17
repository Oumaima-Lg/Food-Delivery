import 'package:ff/pages/bottomnav.dart';
// import 'package:ff/pages/detail_page.dart';
// import 'package:ff/pages/home.dart';
// import 'package:ff/pages/onboarding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNav(),
    );
  }
}
