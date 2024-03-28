import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/theme/pallete.dart';
import 'package:portfolio/core/helper/custom_scroll_physics.dart';
import 'package:portfolio/core/helper/mouse_follower.dart';
import 'package:portfolio/core/widgets/landing_widget.dart';
import 'package:provider/provider.dart';

import '../../providers/project_provider.dart';
import 'project_main.dart';

class ProjectYellowCopy extends StatelessWidget {
  const ProjectYellowCopy(
      {super.key,
      required this.scrollController,
      required this.scrollCOntroller2});

  final ScrollController scrollController;
  final ScrollController scrollCOntroller2;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<ProjectProvider>(
      builder: (context, provider, child) {
        if (MediaQuery.of(context).size.width > 600) {
          return MouseFollower(
              position: provider.position,
              radius: provider.hide
                  ? 0
                  : provider.isMagnified
                      ? size.height * 0.4
                      : 15,
              width: double.infinity,
              height: 60,
              child: ProjectYellowCopyChild(
                scrollController: scrollController,
                size: size,
                scrollController2: scrollCOntroller2,
              ));
        } else {
          return MouseFollower(
              position: !provider.fullMagnify
                  ? Offset(size.width / 2, size.height * 0.9)
                  : Offset(size.width / 2, 0),
              radius: provider.fullMagnify ? size.height : 0,
              width: provider.fullMagnify ? double.infinity : 0,
              height: provider.fullMagnify ? size.height : 0,
              child: MobileProjectYellowCopyChild(
                scrollController: scrollController,
                size: size,
                scrollController2: scrollCOntroller2,
              ));
        }
        // return size.width > 766
        //     ? MouseFollower(
        //         position: provider.position,
        //         radius: provider.hide
        //             ? 0
        //             : provider.isMagnified
        //                 ? size.height * 0.4
        //                 : 15,
        //         height: 60,
        //         width: double.infinity,
        //         child: ProjectYellowCopyChild(
        //           scrollController: scrollController,
        //           size: size,
        //           scrollController2: scrollCOntroller2,
        //         ))
        //     : const SizedBox();
      },
    );
  }
}

class ProjectYellowCopyChild extends StatelessWidget {
  const ProjectYellowCopyChild(
      {super.key,
      required this.scrollController,
      required this.scrollController2,
      required this.size});
  final ScrollController scrollController;
  final ScrollController scrollController2;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (size.width > 600) {
            scrollController2.jumpTo(scrollController.offset);
          }
          return true;
        },
        child: ColoredBox(
          color: Palette.hYellow,
          child: SingleChildScrollView(
            physics: const CustomPhysics(),
            controller: scrollController,
            child: Column(children: [
              SajjadRazaWidget(
                size: size,
                isYellow: true,
              ),
              const LandingWidget(), const LandingWidget(),
              const LandingWidget(), const LandingWidget(),
              const LandingWidget(), const LandingWidget(),
              const LandingWidget(), const LandingWidget()
              // ProjectList(size: size),
              // Connect(
              //   size: size,
              //   isProject: true,
              // )
            ]),
          ),
        ));
  }
}

class MobileProjectYellowCopyChild extends StatelessWidget {
  const MobileProjectYellowCopyChild(
      {super.key,
      required this.scrollController,
      required this.scrollController2,
      required this.size});
  final ScrollController scrollController;
  final ScrollController scrollController2;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Palette.hYellow,
      child: SingleChildScrollView(
        controller: scrollController,
        physics: size.width > 600 ? null : const NeverScrollableScrollPhysics(),
        child: Column(children: [
          SajjadRazaWidget(
            size: size,
            isYellow: true,
          ),
          ProjectList(
            size: size,
            isYellow: true,
          ),
          // Connect(
          //   size: size,
          //   isProject: true,
          // )
        ]),
      ),
    );
  }
}
