import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/router/routes.dart';
import 'package:portfolio/providers/cursor_provider.dart';
import 'package:portfolio/providers/project_provider.dart';
import 'package:portfolio/providers/reqruiters_provider.dart';
import 'package:provider/provider.dart';

// import 'screens/home/home.dart';
// import 'screens/reqruiters/reqruiters_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (c) => CursorProvider()),
          ChangeNotifierProvider(create: (c) => ProjectProvider()),
          ChangeNotifierProvider(create: (c) => RecruitersProvider())
        ],
        builder: (context, _) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              child = botToastBuilder(context, child);
              return child;
            },
            routerConfig: router,
          );
        });
  }
}
