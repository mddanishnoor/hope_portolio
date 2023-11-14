import 'package:flutter/material.dart';
import 'package:portfolio/providers/reqruiters_provider.dart';
import 'package:portfolio/screens/reqruiters/recruiter_yellow.dart';
import 'package:portfolio/screens/reqruiters/reqruiter_black.dart';
import 'package:provider/provider.dart';

import '../../core/constant/theme/pallete.dart';

class RecruitersScreen extends StatelessWidget {
  const RecruitersScreen({super.key});
  static final ScrollController scrollController = ScrollController();

  static final ScrollController scrollController2 = ScrollController();

  @override
  Widget build(BuildContext context) {
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
              child: const Stack(
                children: [RecruitersBlack(), RecruitersYellow()],
              ),
            ),
          ),
        ),
      );
    });
  }
}
