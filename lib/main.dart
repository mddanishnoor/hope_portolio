import 'package:flutter/material.dart';
import 'package:portfolio/providers/cursor_provider.dart';
import 'package:portfolio/providers/project_provider.dart';
import 'package:portfolio/screens/landing_screen/landing_page_1.dart';
import 'package:provider/provider.dart';

import 'screens/project/projects_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (c) => CursorProvider()),
          ChangeNotifierProvider(create: (c) => ProjectProvider())
        ],
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: ProjectScreen(),
          );
        });
  }
}
