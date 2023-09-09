import 'package:flutter/material.dart';
import 'package:portfolio/screens/landing_page_1.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LandingPage1()
    );
  }
}
