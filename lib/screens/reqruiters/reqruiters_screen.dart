import 'package:flutter/material.dart';
import 'package:portfolio/providers/reqruiters_provider.dart';
import 'package:portfolio/screens/reqruiters/recruiter_yellow.dart';
import 'package:portfolio/screens/reqruiters/reqruiter_black.dart';
import 'package:provider/provider.dart';

import '../../core/constant/theme/pallete.dart';
import '../../core/widgets/navigation_bar.dart';

class RecruitersScreen extends StatelessWidget {
  const RecruitersScreen({super.key});
  static final ScrollController scrollController = ScrollController();

  static final ScrollController scrollController2 = ScrollController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<RecruitersProvider>(builder: (context, controller, _) {
      return Scaffold(
        backgroundColor: Palette.black,
        body: MouseRegion(
          onHover: (event) => controller.updatePositioned(event.position),
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              controller.updateScrollOffset(scrollController2.offset);
              // scrollController.jumpTo(scrollController2.offset);
              return false;
            },
            child: PrimaryScrollController(
              controller: scrollController2,
              child: Stack(
                children: [
                  RecruitersBlack(
                      size: size, scrollController2: scrollController2),
                  RecruitersYellow(
                    scrollController: scrollController,
                    scrollController2: scrollController2,
                  ),
                  if (scrollController2.hasClients &&
                      controller.scrollOffset >= (size.height / 2))
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomNavbar(
                        scrollController2,
                        secondaryScrollController: scrollController,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
