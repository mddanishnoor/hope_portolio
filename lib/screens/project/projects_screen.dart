import 'package:flutter/material.dart';
import 'package:portfolio/providers/project_provider.dart';
import 'package:portfolio/screens/project/project_yellow.dart';
import 'package:provider/provider.dart';

import '../../core/constant/theme/pallete.dart';
import '../../core/widgets/project_navbar.dart';
import 'project_main.dart';

class ProjectScreen extends StatelessWidget {
  ProjectScreen({super.key});

  final ScrollController scrollController = ScrollController();
  final ScrollController scrollController2 = ScrollController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<ProjectProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Palette.bgBlack,
          body: MouseRegion(
              onHover: (event) => provider.updatePosition(event.position),
              child: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  // scrollController.jumpTo(scrollController2.offset);
                  provider.updateScrollOffset(scrollController2.offset);
                  return true;
                },
                child: PrimaryScrollController(
                    controller: scrollController2,
                    child: Stack(
                      children: [
                        ProjectMainCopy(
                            size: size, scrollController: scrollController2),
                        ProjectYellowCopy(
                            scrollController: scrollController,
                            scrollCOntroller2: scrollController2),
                        if ((scrollController2.hasClients &&
                                provider.scrollOffset >= (size.height / 2)) ||
                            size.width < 600)
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: size.width < 600
                                  ? ProjectMobileNavbar(scrollController2,
                                      secondaryScrollController:
                                          scrollController)
                                  : ProjectNavbar(
                                      scrollController2,
                                      secondaryScrollController:
                                          scrollController,
                                    ))
                      ],
                    )),
              )),
        );
      },
    );
  }
}
