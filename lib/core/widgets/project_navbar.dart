import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constant/theme/pallete.dart';
import 'package:provider/provider.dart';

import '../../providers/project_provider.dart';

class ProjectNavbar extends StatelessWidget {
  const ProjectNavbar(
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
            // landingpagenavbarstate31Mh (1:13)
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
            child: Consumer<ProjectProvider>(builder: (context, controller, _) {
              return MouseRegion(
                onEnter: (event) => controller.toggleHide(true),
                onExit: (event) => controller.toggleHide(false),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NavButton(
                      label: 'Hope',
                      onTap: () =>
                          {log('Hope presssed'), Navigator.pop(context)},
                      isActive: controller.scrollOffset >= activeHeight(h, 1) &&
                          controller.scrollOffset < activeHeight(h, 2.7),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    NavButton(
                      label: 'UX/UI',
                      onTap: () => {
                        log('UX/UI'),
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
                    const SizedBox(
                      width: 5,
                    ),
                    NavButton(
                      label: 'Misc',
                      onTap: () => {
                        log('Misc presssed'),
                        scrollController.animateTo((h * 5) - (h * 0.3),
                            duration: const Duration(milliseconds: 1500),
                            curve: Curves.decelerate),
                        secondaryScrollController.animateTo((h * 5) - (h * 0.3),
                            duration: const Duration(milliseconds: 1500),
                            curve: Curves.decelerate)
                      },
                      isActive: false,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    NavButton(
                      label: 'Connect',
                      onTap: () => {
                        log('Connect presssed'),
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
                              ((activeHeight(h, 5)) - (h * 0.2)) &&
                          controller.scrollOffset <=
                              (scrollController.position.maxScrollExtent),
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
                  fontSize: 16,
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
