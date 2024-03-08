import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/theme/pallete.dart';
import 'package:portfolio/core/widgets/navigation_bar.dart';
import 'package:portfolio/providers/cursor_provider.dart';
import 'package:portfolio/screens/home/yellow_copy.dart';
import 'package:provider/provider.dart';

import 'main_copy.dart';
import 'widgets/visit_destop.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final ScrollController scrollController = ScrollController();

  final ScrollController scrollController2 = ScrollController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return size.width < 600
        ? const VisitDesktop()
        : Consumer<CursorProvider>(builder: (context, controller, _) {
            return Scaffold(
              backgroundColor: Palette.black,
              body: SafeArea(
                child: MouseRegion(
                  onHover: (event) => size.width >= 600
                      ? controller.updatePositioned(event.position)
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
                          BlackCopy(
                              size: size, scrollController2: scrollController2),
                          YellowCopy(
                            scrollController: scrollController,
                            scrollController2: scrollController2,
                          ),
                          if ((scrollController2.hasClients &&
                                  controller.scrollOffset >=
                                      (size.height / 2)) ||
                              size.width <= 600)
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
              ),
            );
          });
  }
}
