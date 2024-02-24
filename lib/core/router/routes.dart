import 'package:go_router/go_router.dart';
import '../../screens/home/home.dart';
import '../../screens/project/projects_screen.dart';
import '../../screens/reqruiters/reqruiters_screen.dart';

class Routes {
  static const homeScreen = '/';
  static const projects = 'projects';
  static const requiters = 'recruiter';
}

final router = GoRouter(routes: [
  GoRoute(
      path: Routes.homeScreen,
      name: Routes.homeScreen,
      builder: (context, state) => HomeScreen(),
      routes: [
        GoRoute(
            path: Routes.projects,
            name: Routes.projects,
            builder: (context, state) => ProjectScreen(),
            routes: const []),
        GoRoute(
            path: Routes.requiters,
            name: Routes.requiters,
            builder: (context, state) => RecruitersScreen(),
            routes: const [])
      ])
]);
