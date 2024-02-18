import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/theme/pallete.dart';
import 'package:portfolio/providers/reqruiters_provider.dart';
import 'package:portfolio/screens/reqruiters/recruiter_yellow.dart';
import 'package:portfolio/screens/reqruiters/reqruiter_black.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/navigation_bar.dart';

// import '../../core/widgets/navigation_bar.dart';

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
          onHover: (event) => controller.updatePositioned(event.position),
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              controller.updateScrollOffset(scrollController2.offset);
              // scrollController.jumpTo(scrollController2.offset);
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
                  // if ((scrollController2.hasClients &&
                  //         controller.scrollOffset >= (size.height / 2)) ||
                  //     size.width < 600)
                  //   Align(
                  //     alignment: Alignment.bottomCenter,
                  //     child: Container(
                  //       height: 54,
                  //       width: 54,
                  //       margin: const EdgeInsets.only(right: 8, bottom: 11),
                  //       decoration: ShapeDecoration(
                  //         color: const Color(0xFFFBB023),
                  //         shape: RoundedRectangleBorder(
                  //           side: BorderSide(
                  //               width: 1, color: Colors.white.withOpacity(0.5)),
                  //           borderRadius: BorderRadius.circular(45),
                  //         ),
                  //         shadows: const [
                  //           BoxShadow(
                  //             color: Color(0x72000000),
                  //             blurRadius: 5,
                  //             offset: Offset(0, 4),
                  //             spreadRadius: -2,
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  if ((scrollController2.hasClients &&
                          controller.scrollOffset >= (size.height / 2)) ||
                      size.width < 600)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: RecruiterNavbar(
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
