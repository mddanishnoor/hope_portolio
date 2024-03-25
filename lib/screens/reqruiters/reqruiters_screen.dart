import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/theme/pallete.dart';
import 'package:portfolio/providers/reqruiters_provider.dart';
import 'package:portfolio/screens/reqruiters/recruiter_yellow.dart';
import 'package:portfolio/screens/reqruiters/reqruiter_black.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/recruiter_navbar.dart';
// import '../home/widgets/visit_destop.dart';

class RecruitersScreen extends StatelessWidget {
  RecruitersScreen({Key? key}) : super(key: key);
  final ScrollController scrollController = ScrollController();
  final ScrollController scrollController2 = ScrollController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<RecruitersProvider>(builder: (context, controller, _) {
      return Scaffold(
        backgroundColor: Palette.black,
        body: MouseRegion(
          onHover: (event) => size.width >= 600
              ? controller.updatePosition(event.position)
              : null,
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              controller.updateScrollOffset(scrollController2.offset);
              if (size.width > 600) {
                scrollController.jumpTo(scrollController2.offset);
              }
              return true;
            },
            child: PrimaryScrollController(
              controller: scrollController2,
              child: Stack(
                children: [
                  RecruitersBlack(
                      size: size, scrollController2: scrollController2),
                  RecruiterYellow(
                    scrollController: scrollController,
                    scrollController2: scrollController2,
                  ),
                  if ((scrollController2.hasClients &&
                          controller.scrollOffset >= (size.height / 2)) ||
                      size.width < 600)
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: size.width > 600
                            ? RecruiterNavbar(scrollController2,
                                secondaryScrollController: scrollController)
                            : RecruiterMobileNavbar(
                                scrollController2,
                                secondaryScrollController: scrollController,
                              ))
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
