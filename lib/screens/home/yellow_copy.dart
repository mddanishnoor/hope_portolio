// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constant/theme/styles.dart';
import 'package:portfolio/providers/cursor_provider.dart';
import 'package:provider/provider.dart';

import '../../core/constant/theme/pallete.dart';
// import '../core/widgets/animated_tile.dart';
import '../../core/helper/mouse_follower.dart';
import '../../core/widgets/animated_tile.dart';
import '../../core/widgets/custom_elevated_button.dart';
import '../../core/widgets/landing_widget.dart';
import '../../core/widgets/yellow_tile.dart';
import 'widgets/connect_tiles.dart';
import '../project/projects_screen.dart';

class YellowCopy extends StatelessWidget {
  const YellowCopy({
    super.key,
    required this.scrollController,
    required this.scrollController2,
  });
  final ScrollController scrollController;
  final ScrollController scrollController2;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<CursorProvider>(builder: (context, controller, _) {
      double radius = (size.width < 766) && !controller.fullMagnify
          ? 0
          : controller.hide
              ? 0
              : controller.isMagnified
                  ? controller.fullMagnify
                      ? size.height
                      : size.height * 0.4
                  : 15;
      return MouseFollower(
          position: controller.position,
          radius: radius,
          width: double.infinity,
          height: 60,
          child: LandingPage2Child(
            scrollController: scrollController,
            size: size,
            scrollController2: scrollController2,
          ));
      // } else {
      //   return const SizedBox();
      // }
    });
  }
}

class LandingPage2Child extends StatelessWidget {
  const LandingPage2Child({
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
              YellowAdvocateWidget(size: size),
              LandingWidget(
                  height: size.width > 600
                      ? null
                      : MediaQuery.of(context).size.height * 0.6,
                  color: Palette.hYellow,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.1046),
                    child: Column(
                      children: [
                        const Spacer(),
                        MouseRegion(
                          onEnter: (event) => size.width > 600
                              ? context
                                  .read<CursorProvider>()
                                  .toggleMagnify(true)
                              : null,
                          onExit: (event) => size.width > 600
                              ? context
                                  .read<CursorProvider>()
                                  .toggleMagnify(false)
                              : null,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ABOUT ME',
                                  style: size.width > 600
                                      ? AppTextStyle.anotation
                                          .copyWith(color: Palette.bgBlack)
                                      : AppTextStyle.mobileAnnotation
                                          .copyWith(color: Palette.bgBlack),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'A designer who does more than just design, for those who want more than just design.',
                                  style: size.width > 600
                                      ? AppTextStyle.body
                                          .copyWith(color: Palette.black)
                                      : AppTextStyle.mobileBody
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
              size.width > 600
                  ? LandingWidget(
                      color: Palette.hYellow,
                      child: Column(
                        children: [
                          const Spacer(),
                          MouseRegion(
                            onEnter: (event) =>
                                context.read<CursorProvider>().toggleHide(true),
                            onExit: (event) => context
                                .read<CursorProvider>()
                                .toggleHide(false),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.105),
                                  child: Text(
                                    'WHAT I DO',
                                    style: AppTextStyle.anotation
                                        .copyWith(color: Palette.bgBlack),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                YellowTileWidget(
                                  size: size,
                                  label: 'UX/UI Design',
                                  secondLabel: '',
                                ),
                                YellowTileWidget(
                                  size: size,
                                  label: 'Design systems',
                                  secondLabel: '',
                                ),
                                YellowTileWidget(
                                  size: size,
                                  label: 'UX Research',
                                  secondLabel: '',
                                ),
                                YellowTileWidget(
                                  size: size,
                                  label: 'Design Facilitation',
                                  secondLabel: '',
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    )
                  : MobileWhatIdoYellowWidget(size: size),
              LandingWidget(
                color: Palette.hYellow,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.105),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PROJECTS ',
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
                                horizontal: size.width * 0.065,
                                vertical: size.height * 0.0299,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'My favorite \nprojects',
                                    style: AppTextStyle.listExtended
                                        .copyWith(color: Palette.bgBlack),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (c) => ProjectScreen()));
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
                      onEnter: (event) =>
                          context.read<CursorProvider>().toggleMagnify(true),
                      onExit: (event) =>
                          context.read<CursorProvider>().toggleMagnify(false),
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

class YellowAdvocateWidget extends StatelessWidget {
  const YellowAdvocateWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return LandingWidget(
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
                fontSize: size.width > 600 ? 32 : 21.961,
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
                  onEnter: (event) =>
                      context.read<CursorProvider>().toggleMagnify(true),
                  onExit: (event) =>
                      context.read<CursorProvider>().toggleMagnify(false),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'RAZA MEANS HOPE',
                          textAlign: TextAlign.center,
                          style: size.width > 600
                              ? AppTextStyle.anotation
                                  .copyWith(color: Palette.bgBlack)
                              : AppTextStyle.mobileAnnotation
                                  .copyWith(color: Palette.bgBlack),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'DRIVER',
                          overflow: TextOverflow.fade,
                          style: size.width > 600
                              ? AppTextStyle.heading
                                  .copyWith(color: Palette.bgBlack)
                              : AppTextStyle.mobileHeading
                                  .copyWith(color: Palette.bgBlack),
                        ),
                        Text(
                          'FOR COMPANY\nGROWTH',
                          textAlign: TextAlign.center,
                          style: size.width > 600
                              ? AppTextStyle.heading
                                  .copyWith(color: Palette.bgBlack)
                              : AppTextStyle.mobileHeading
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
    );
  }
}

class MobileWhatIdoYellowWidget extends StatelessWidget {
  const MobileWhatIdoYellowWidget({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return LandingWidget(
      height: MediaQuery.of(context).size.height * 0.6,
      color: Palette.hYellow,
      child: Column(
        children: [
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.105),
                child: Text(
                  'WHAT I DO',
                  style: AppTextStyle.mobileAnnotation
                      .copyWith(color: Palette.bgBlack),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              elementWidget('UX/UI', 'Mostly designing websites and apps'),
              elementWidget('SYSTEMS',
                  'Designing systems for the company to function efficiently'),
              elementWidget('FACILITATION', 'Helping others, design'),
              elementWidget(
                  'RESEARCH', 'My job is to know what the users wants'),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Container elementWidget(String label, String subtext) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Palette.hYellow,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Palette.white_30.withOpacity(0.2),
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.105,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 4,
          ),
          Text(
            label,
            style: AppTextStyle.mobileHeading
                .copyWith(color: Palette.bgBlack.withOpacity(0.6)),
          ),
          Text(
            subtext,
            style: GoogleFonts.archivo(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Palette.bgBlack),
          ),
        ],
      ),
    );
  }
}
