import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/providers/reqruiters_provider.dart';
import 'package:provider/provider.dart';

import '../constant/theme/pallete.dart';

class RecruiterNavbar extends StatelessWidget {
  const RecruiterNavbar(
    this.scrollController, {
    super.key,
    required this.secondaryScrollController,
  });
  final ScrollController scrollController;

  final ScrollController secondaryScrollController;

  double activeHeight(double height, double factor) {
    var h = (height * factor) - (height * 0.3);
    return h;
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(bottom: 17),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4,
            sigmaY: 4,
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            // width: size.width * 0.31844,
            height: 49,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: const Border(),
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[Color(0x33ffffff), Color(0x00ffffff)],
                stops: <double>[0, 1],
              ),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(-0.5, 0),
                  blurRadius: 2,
                  spreadRadius: -1,
                  blurStyle: BlurStyle.outer,
                  color: Color.fromRGBO(255, 255, 255, 0.229),
                ),
                BoxShadow(
                    offset: Offset(-0.5, 0),
                    blurRadius: 2,
                    spreadRadius: -1,
                    blurStyle: BlurStyle.outer,
                    color: Color.fromRGBO(255, 255, 255, 0.153)),
              ],
            ),
            child:
                Consumer<RecruitersProvider>(builder: (context, controller, _) {
              return MouseRegion(
                onEnter: (event) => controller.toggleHide(true),
                onExit: (event) => controller.toggleHide(false),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NavButton(
                      label: 'About Me',
                      onTap: () => scrollController.jumpTo(h),
                      isActive:
                          controller.scrollOffset >= activeHeight(h * 0.5, 1) &&
                              controller.scrollOffset < activeHeight(h, 2.2),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    NavButton(
                      label: 'Project',
                      onTap: () => scrollController.jumpTo(h * 4.8),
                      isActive: controller.scrollOffset >= activeHeight(h, 5) &&
                          controller.scrollOffset < (activeHeight(h, 6)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    NavButton(
                      label: 'Connect',
                      onTap: () => scrollController.jumpTo(
                        scrollController.position.maxScrollExtent - h,
                      ),
                      isActive: controller.scrollOffset >=
                              (scrollController.position.maxScrollExtent -
                                  (h * 1.3)) &&
                          controller.scrollOffset <=
                              (scrollController.position.maxScrollExtent -
                                  (h / 2)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    NavButton(
                      label: MediaQuery.of(context).size.width > 600
                          ? 'For Recruiters'
                          : 'Recruiters',
                      onTap: () => scrollController
                          .jumpTo(scrollController.position.maxScrollExtent),
                      isActive: controller.scrollOffset >
                          (scrollController.position.maxScrollExtent -
                              (h * 0.4)),
                    )
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class RecruiterMobileNavbar extends StatelessWidget {
  const RecruiterMobileNavbar(
    this.scrollController, {
    super.key,
    required this.secondaryScrollController,
  });
  final ScrollController scrollController;

  final ScrollController secondaryScrollController;

  double activeHeight(double height, double factor) {
    var h = (height * factor) - (height * 0.3);
    return h;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var h = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(bottom: 17),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4,
            sigmaY: 4,
          ),
          child: Container(
            // landingpagenavbarstate31Mh (1:13)
            // width: size.width * 0.31844,
            height: size.width > 600 ? 49 : 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: const Border(),
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[Color(0x33ffffff), Color(0x00ffffff)],
                stops: <double>[0, 1],
              ),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(-0.5, 0),
                  blurRadius: 2,
                  spreadRadius: -1,
                  blurStyle: BlurStyle.outer,
                  color: Color.fromRGBO(255, 255, 255, 0.229),
                ),
                BoxShadow(
                  offset: Offset(-0.5, 0),
                  blurRadius: 2,
                  spreadRadius: -1,
                  blurStyle: BlurStyle.outer,
                  color: Color.fromRGBO(255, 255, 255, 0.153),
                ),
              ],
            ),
            child:
                Consumer<RecruitersProvider>(builder: (context, controller, _) {
              return MouseRegion(
                onEnter: (event) => controller.toggleHide(true),
                onExit: (event) => controller.toggleHide(false),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
                      child: NavButton(
                        label: 'About Me',
                        onTap: () => {
                          scrollController.animateTo(h * 0.97,
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.decelerate),
                          secondaryScrollController.animateTo(h,
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.decelerate)
                        },
                        isActive: controller.scrollOffset >=
                                activeHeight(h * 0.97, 1) &&
                            controller.scrollOffset < activeHeight(h * 3.9, 1),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: NavButton(
                        label: 'Projects',
                        onTap: () => {
                          scrollController.animateTo(h * 4.2,
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.decelerate),
                          secondaryScrollController.animateTo(h * 3.2,
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.decelerate)
                        },
                        isActive: controller.scrollOffset >=
                                activeHeight(h * 4, 1) &&
                            controller.scrollOffset < activeHeight(h * 4.65, 1),
                      ),
                    ),
                    if (size.width < 600) ...[
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTapDown: (details) =>
                            controller.toggleMagnify(true, fullScreen: true),
                        onTapUp: (details) =>
                            controller.toggleMagnify(false, fullScreen: false),
                        // onTapCancel: () =>
                        //     controller.toggleMagnify(false, fullScreen: false),
                        child: const HoldMeButton(),
                      ),
                    ],
                    const SizedBox(
                      width: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: NavButton(
                        label: 'Connect',
                        onTap: () => {
                          scrollController.animateTo((h * 4) - (h * 0.3),
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.decelerate),
                          secondaryScrollController.animateTo(
                              (h * 5) - (h * 0.3),
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.decelerate)
                        },
                        isActive: controller.scrollOffset >=
                                activeHeight(h * 4.65, 1) &&
                            controller.scrollOffset <
                                (scrollController.position.maxScrollExtent -
                                    (h * 0.4)),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 5, 5),
                      child: NavButton(
                        label: 'For Recruiter',
                        onTap: () => {
                          scrollController.animateTo(
                              scrollController.position.maxScrollExtent,
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.decelerate),
                          secondaryScrollController.animateTo(
                              scrollController.position.maxScrollExtent,
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.decelerate)
                        },
                        isActive: controller.scrollOffset >=
                            (scrollController.position.maxScrollExtent -
                                (h * 0.4)),
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class HoldMeButton extends StatelessWidget {
  const HoldMeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<RecruitersProvider>(builder: (context, provider, _) {
      return Container(
        width: 54,
        height: 52,
        // padding: const EdgeInsets.symmetric(
        //     horizontal: 5, vertical: 10),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFFFBB023),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Colors.white.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(45),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x72000000),
              blurRadius: 5,
              offset: Offset(0, 4),
              spreadRadius: -2,
            )
          ],
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hold me',
              style: TextStyle(
                color: Color(0xFF141312),
                fontSize: 10,
                fontFamily: 'Syne',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class NavButton extends StatelessWidget {
  const NavButton({
    super.key,
    this.onTap,
    required this.label,
    required this.isActive,
  });
  final void Function()? onTap;
  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 40,
            sigmaY: 40,
          ),
          child: Container(
            // width: double.infinity,
            padding: const EdgeInsets.all(10),
            height: 39,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color.fromRGBO(0, 0, 0, 0.8),
                  Color.fromRGBO(0, 0, 0, 0.4)
                ],
                stops: <double>[0, 1],
              ),
              border: !isActive
                  ? null
                  : Border.all(color: Palette.hYellow, width: 0.5),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(-0.5, 0),
                  blurRadius: 2,
                  spreadRadius: -1,
                  blurStyle: BlurStyle.outer,
                  color: Color.fromRGBO(255, 255, 255, 0.628),
                ),
                BoxShadow(
                    offset: Offset(-0.5, 0),
                    blurRadius: 2,
                    spreadRadius: -1,
                    blurStyle: BlurStyle.outer,
                    color: Color.fromRGBO(255, 255, 255, 0.553)),
              ],
            ),
            child: Center(
              child: Text(
                label,
                style: GoogleFonts.syne(
                  fontSize: size.width > 600 ? 16 : 10,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                  color: const Color(0xffece5d3),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
