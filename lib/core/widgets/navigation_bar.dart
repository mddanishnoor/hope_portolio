import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constant/theme/pallete.dart';
import 'package:portfolio/providers/cursor_provider.dart';
import 'package:provider/provider.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar(
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
                    color: Color.fromRGBO(255, 255, 255, 0.153)),
              ],
            ),
            child: Consumer<CursorProvider>(builder: (context, controller, _) {
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
                        label: 'About me',
                        onTap: () => {
                          log('Abut me presssed'),
                          scrollController.jumpTo(
                            h,
                            // duration: const Duration(milliseconds: 1500),
                            // curve: Curves.decelerate
                          ),
                          // secondaryScrollController.jumpTo(
                          //   h,
                          //   // duration: const Duration(milliseconds: 1500),
                          //   // curve: Curves.decelerate
                          // )
                        },
                        isActive:
                            controller.scrollOffset >= activeHeight(h, 1) &&
                                controller.scrollOffset < activeHeight(h, 2.2),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: NavButton(
                        label: 'Project',
                        onTap: () => {
                          log('Project presssed'),
                          // scrollController.animateTo(h * 3,
                          //     duration: const Duration(milliseconds: 1500),
                          //     curve: Curves.decelerate),
                          secondaryScrollController.jumpTo(
                            h * 3,
                            // duration: const Duration(milliseconds: 1500),
                            // curve: Curves.decelerate
                          )
                        },
                        isActive:
                            controller.scrollOffset >= activeHeight(h, 2.7) &&
                                controller.scrollOffset <
                                    (activeHeight(h, 4) - h * 0.2),
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
                          log('Connect presssed'),
                          scrollController.jumpTo(
                            (h * 5.3) - (h * 0.3),
                            // duration: const Duration(milliseconds: 1500),
                            // curve: Curves.decelerate
                          ),
                          // secondaryScrollController.animateTo(
                          //     (h * 5) - (h * 0.3),
                          //     duration: const Duration(milliseconds: 1500),
                          //     curve: Curves.decelerate)
                        },
                        isActive: controller.scrollOffset >=
                                ((activeHeight(h, 5)) - (h * 0.2)) &&
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
                        label:
                            size.width > 600 ? 'For recruiters' : 'Recruiters',
                        onTap: () => {
                          log('Recruiters presssed'),
                          scrollController.jumpTo(
                            scrollController.position.maxScrollExtent,
                            // duration: const Duration(milliseconds: 1500),
                            // curve: Curves.decelerate
                          ),
                          // secondaryScrollController.animateTo(
                          //     scrollController.position.maxScrollExtent,
                          //     duration: const Duration(milliseconds: 1500),
                          //     curve: Curves.decelerate)
                        },
                        isActive: controller.scrollOffset >
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
    return Consumer<CursorProvider>(builder: (context, provider, _) {
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
                    color: Color.fromRGBO(255, 255, 255, 0.153)),
              ],
            ),
            child: Consumer<CursorProvider>(builder: (context, controller, _) {
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
                        label: 'About me',
                        onTap: () => {
                          log('Abut me presssed'),
                          scrollController.animateTo(h,
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.decelerate),
                          secondaryScrollController.animateTo(h,
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.decelerate)
                        },
                        isActive:
                            controller.scrollOffset >= activeHeight(h, 1) &&
                                controller.scrollOffset < activeHeight(h, 2.7),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: NavButton(
                        label: 'Project',
                        onTap: () => {
                          log('Project presssed'),
                          scrollController.animateTo(h * 3,
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.decelerate),
                          secondaryScrollController.animateTo(h * 3,
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.decelerate)
                        },
                        isActive:
                            controller.scrollOffset >= activeHeight(h, 2.7) &&
                                controller.scrollOffset <
                                    (activeHeight(h, 5) - h * 0.2),
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
                          log('Connect presssed'),
                          scrollController.animateTo((h * 5) - (h * 0.3),
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.decelerate),
                          secondaryScrollController.animateTo(
                              (h * 5) - (h * 0.3),
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.decelerate)
                        },
                        isActive: controller.scrollOffset >=
                                ((activeHeight(h, 5)) - (h * 0.2)) &&
                            controller.scrollOffset <
                                (scrollController.position.maxScrollExtent -
                                    (h * 0.2)),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 5, 5),
                      child: NavButton(
                        label:
                            size.width > 600 ? 'For recruiters' : 'Recruiters',
                        onTap: () => {
                          log('Recruiters presssed'),
                          scrollController.animateTo(
                              scrollController.position.maxScrollExtent,
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.decelerate),
                          secondaryScrollController.animateTo(
                              scrollController.position.maxScrollExtent,
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.decelerate)
                        },
                        isActive: controller.scrollOffset >
                            (scrollController.position.maxScrollExtent -
                                (h * 0.2)),
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
