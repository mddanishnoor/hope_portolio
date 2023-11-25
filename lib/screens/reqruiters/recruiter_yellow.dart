// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constant/theme/styles.dart';
import 'package:portfolio/providers/reqruiters_provider.dart';
import 'package:provider/provider.dart';

import '../../core/constant/theme/pallete.dart';
// import '../core/widgets/animated_tile.dart';
import '../../core/helper/mouse_follower.dart';
import '../../core/widgets/animated_tile.dart';
import '../../core/widgets/custom_elevated_button.dart';
import '../../core/widgets/landing_widget.dart';
import '../home/widgets/connect_tiles.dart';

class RecruiterYellow extends StatelessWidget {
  const RecruiterYellow({
    super.key,
    required this.scrollController,
    required this.scrollController2,
  });
  final ScrollController scrollController;
  final ScrollController scrollController2;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<RecruitersProvider>(builder: (context, controller, _) {
      if (MediaQuery.of(context).size.width > 766) {
        return MouseFollower(
            position: controller.position,
            radius: controller.hide
                ? 0
                : controller.isMagnified
                    ? size.height * 0.4
                    : 15,
            width: double.infinity,
            height: 60,
            child: RecruiterYellowChild(
              scrollController: scrollController,
              size: size,
              scrollController2: scrollController2,
            ));
      } else {
        return const SizedBox();
      }
    });
  }
}

class RecruiterYellowChild extends StatelessWidget {
  const RecruiterYellowChild({
    super.key,
    required this.scrollController,
    required this.size,
    required this.scrollController2,
  });

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
        color: Palette.hYellow,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              LandingWidget(
                color: Palette.hYellow,
                child: Stack(
                  children: [
                    Positioned(
                      left: size.height * 0.0241,
                      top: size.height * 0.063,
                      child: Text(
                        'HOPE',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.bebasNeue(
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                          height: 0.8599999547,
                          color: Palette.bgBlack,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const Spacer(),
                        Align(
                          alignment: Alignment.center,
                          child: MouseRegion(
                            onEnter: (event) => context
                                .read<RecruitersProvider>()
                                .toggleMagnify(true),
                            onExit: (event) => context
                                .read<RecruitersProvider>()
                                .toggleMagnify(false),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'RAZA MEANS HOPE',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.anotation
                                        .copyWith(color: Palette.bgBlack),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    'HEL PING',
                                    overflow: TextOverflow.fade,
                                    style: AppTextStyle.heading
                                        .copyWith(color: Palette.bgBlack),
                                  ),
                                  Text(
                                    'CLIENTS\nMANEUVER',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.heading
                                        .copyWith(color: Palette.bgBlack),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Spacer()
                      ],
                    ),
                  ],
                ),
              ),
              LandingWidget(
                  color: Palette.hYellow,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.1046),
                    child: Column(
                      children: [
                        const Spacer(),
                        MouseRegion(
                          onEnter: (event) => context
                              .read<RecruitersProvider>()
                              .toggleMagnify(true),
                          onExit: (event) => context
                              .read<RecruitersProvider>()
                              .toggleMagnify(false),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ABOUT ME',
                                  style: AppTextStyle.anotation
                                      .copyWith(color: Palette.bgBlack),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'I am a fresh graduate with a masters degree in UX/UI design, (think of design thinking)                ',
                                  style: AppTextStyle.body
                                      .copyWith(color: Palette.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  )),
              MouseRegion(
                onEnter: (event) =>
                    context.read<RecruitersProvider>().toggleHide(true),
                onExit: (event) =>
                    context.read<RecruitersProvider>().toggleHide(false),
                child: const LandingWidget(
                    color: Palette.hYellow, child: SizedBox()),
              ),
              LandingWidget(
                color: Palette.hYellow,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.105),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Certifications ',
                        style: AppTextStyle.anotation
                            .copyWith(color: Palette.bgBlack),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: size.height * 0.84,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(width: 1, color: Palette.bgBlack)),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.05,
                                vertical: size.height * 0.0299,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Google UX Design\nProfessional Certificate    ',
                                    style: AppTextStyle.listExtended.copyWith(
                                        fontSize: 45, color: Palette.bgBlack),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (c) => ProjectScreen()));
                                    },
                                    child: Container(
                                      width: 90,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Palette.bgBlack),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'See all >>',
                                          style: AppTextStyle.buttonTextStyle
                                              .copyWith(color: Palette.bgBlack),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: size.height * 0.653,
                                decoration: BoxDecoration(
                                  color: Palette.grey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              LandingWidget(
                color: Palette.hYellow,
                child: Column(
                  children: [
                    const Spacer(),
                    MouseRegion(
                      onEnter: (event) => context
                          .read<RecruitersProvider>()
                          .toggleMagnify(true),
                      onExit: (event) => context
                          .read<RecruitersProvider>()
                          .toggleMagnify(false),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'MY MOTO',
                            style: AppTextStyle.anotation
                                .copyWith(color: Palette.bgBlack),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Text(
                            'SAME\nSTROKES FOR\nSIMILAR\nFOLKS',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.heading
                                .copyWith(color: Palette.bgBlack),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              LandingWidget(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.105, right: size.width * 0.08),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Connect',
                        style: AppTextStyle.anotation
                            .copyWith(color: Palette.bgBlack),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      const Column(
                        children: [
                          ConnectTiles(
                            title: 'LinkedIn',
                            subtitle: 'Work, work, work',
                            connectType: 'EMAIL',
                            value: 'razamohdsajjad@gmail.com',
                          ),
                          ConnectTiles(
                            title: 'Behance',
                            subtitle: 'Another POV at my projects',
                            connectType: 'Phone',
                            value: '+91 9818164010',
                          ),
                          ConnectTiles(
                            title: 'Instagram',
                            subtitle: 'My inactive social face',
                            connectType: 'Phone',
                            value: '+91 9818164010',
                            hasConnectValue: false,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.2,
                      ),
                      Text(
                        'FOR REQRUITERS',
                        style: AppTextStyle.anotation
                            .copyWith(color: Palette.bgBlack),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          AnimatedTileContainer(
                            child1: Text(
                              'If you like to hire me',
                              style: GoogleFonts.syne(
                                // 'Syne',
                                fontSize: 64,
                                fontWeight: FontWeight.w600,
                                height: 1.0049999952,
                                color: Palette.notWhite,
                              ),
                            ),
                            child2: ColoredBox(
                              color: Palette.hYellow,
                              child: Text(
                                'If you like to hire me',
                                style: GoogleFonts.syne(
                                  // 'Syne',
                                  fontSize: 64,
                                  fontWeight: FontWeight.w600,
                                  height: 1.0049999952,
                                  color: Palette.bgBlack,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          const AnimatedTileContainer(
                            child1: CustomElevatedButton(
                              label: 'Click here',
                              isYellow: false,
                            ),
                            child2: CustomElevatedButton(
                              label: 'Click here',
                              isYellow: true,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
