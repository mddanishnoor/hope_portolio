import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/theme/pallete.dart';
import 'package:portfolio/core/widgets/navigation_bar.dart';
import 'package:portfolio/providers/cursor_provider.dart';
import 'package:portfolio/screens/landing_page_2.dart';
import 'package:provider/provider.dart';

import 'main_copy.dart';

class LandingPage1 extends StatelessWidget {
  LandingPage1({Key? key}) : super(key: key);
  final ScrollController scrollController = ScrollController();

  final ScrollController scrollController2 = ScrollController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<CursorProvider>(builder: (context, controller, _) {
      return Scaffold(
        backgroundColor: Pallete.black,
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
                  MainCopy(size: size, scrollController2: scrollController2),
                  LandingPage2(
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

class LandingWidget extends StatelessWidget {
  const LandingWidget({
    super.key,
    this.color,
    this.child,
    this.decoration,
  });
  final Color? color;
  final Widget? child;
  final Decoration? decoration;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: decoration,
      color: decoration == null ? color : null,
      child: child,
    );
  }
}
