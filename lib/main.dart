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
      debugShowCheckedModeBanner: false,
      home: LandingPage1(),
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSwatch()
      //       .copyWith(primary: Pallete.yellow, secondary: Pallete.black),
      //   textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
      // ),
    );
  }
}
