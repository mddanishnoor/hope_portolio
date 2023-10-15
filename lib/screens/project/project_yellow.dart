import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/theme/pallete.dart';
import 'package:portfolio/core/helper/mouse_follower.dart';
import 'package:provider/provider.dart';

import '../../providers/project_provider.dart';
import '../connect_widget.dart';
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
        return size.width > 766
            ? MouseFollower(
                position: provider.position,
                radius: provider.hide
                    ? 0
                    : provider.isMagnified
                        ? size.height * 0.4
                        : 15,
                height: 60,
                width: double.infinity,
                child: ProjectYellowCopyChild(
                  scrollController: scrollController,
                  size: size,
                  scrollController2: scrollCOntroller2,
                ))
            : const SizedBox();
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
          scrollController2.jumpTo(scrollController.offset);
          return true;
        },
        child: ColoredBox(
          color: Pallete.hYellow,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(children: [
              SajjadRazaWidget(
                size: size,
                isYellow: true,
              ),
              ProjectList(
                size: size,
                isYellow: true,
              ),
              ConnectWidget(size: size)
            ]),
          ),
        ));
  }
}
