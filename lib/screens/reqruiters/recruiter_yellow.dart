// import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constant/theme/styles.dart';
import 'package:portfolio/providers/reqruiters_provider.dart';
import 'package:provider/provider.dart';

import '../../core/constant/constants.dart';
import '../../core/constant/theme/pallete.dart';
// import '../core/widgets/animated_tile.dart';
import '../../core/helper/mouse_follower.dart';
import '../../core/widgets/custom_elevated_button.dart';
import '../../core/widgets/landing_widget.dart';
import '../../core/widgets/project_card.dart';
import '../home/widgets/connect_tiles.dart';
import '../project/projects_screen.dart';
import 'widgets/certifcate_widget.dart';
import 'widgets/req_animated_tile.dart';

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
      if (MediaQuery.of(context).size.width > 600) {
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
        // return const SizedBox();
        return MobileRecruiterYellowChild(
            scrollController: scrollController,
            size: size,
            scrollController2: scrollController2);
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
              ///HELPING WIDGET
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

              ///ABOUTME WIDGET
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

              ///WHATIDO WIDGET
              const LandingWidget(),

              ///CERTIFICATE WIDGET
              CertificateWidget(
                size: size,
                isYellow: true,
              ),

              ///EXPERIENCE WIDGET
              const LandingWidget(),

              ///EDUCATION WIDGET
              const LandingWidget(),

              ///PROJECTS WIDGET
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

              ///CORECOMPETENCY WIDGET
              const LandingWidget(),

              ///MOTO WIDGET
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
                          const SizedBox(
                            height: 18,
                          ),
                          Text(
                            '- MOHAMMAD ALI',
                            style: AppTextStyle.anotation
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
                          ReqAnimatedTileContainer(
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
                          const ReqAnimatedTileContainer(
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

class MobileRecruiterYellowChild extends StatelessWidget {
  const MobileRecruiterYellowChild({
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
              ///HELPING WIDGET
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
                          fontSize: 21.961,
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
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'RAZA MEANS HOPE',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.mobileAnnotation
                                      .copyWith(color: Palette.bgBlack),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'HELPING',
                                  overflow: TextOverflow.fade,
                                  style: AppTextStyle.mobileHeading
                                      .copyWith(color: Palette.bgBlack),
                                ),
                                Text(
                                  'CLIENTS\nMANEUVER',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.mobileHeading
                                      .copyWith(color: Palette.bgBlack),
                                )
                              ],
                            ),
                          ),
                        ),
                        const Spacer()
                      ],
                    ),
                  ],
                ),
              ),

              ///ABOUTME WIDGET
              LandingWidget(
                  height: size.height * 0.6,
                  color: Palette.hYellow,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ABOUT ME',
                          style: AppTextStyle.mobileAnnotation
                              .copyWith(color: Palette.bgBlack),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'I am a fresh graduate with a masters degree in UX/UI design, (think of design thinking)                ',
                          style: AppTextStyle.mobileBody
                              .copyWith(color: Palette.black),
                        )
                      ],
                    ),
                  )),

              ///WHATIDO WIDGET
              LandingWidget(
                height: MediaQuery.of(context).size.height * 0.6,
                color: Palette.hYellow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'WHAT I DO',
                        style: AppTextStyle.mobileAnnotation
                            .copyWith(color: Palette.bgBlack),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    elementWidget(
                        'UX/UI', 'Mostly designing websites and apps'),
                    elementWidget('SYSTEMS',
                        'Designing systems for the company to function efficiently'),
                    elementWidget('FACILITATION', 'Helping others, design'),
                    elementWidget(
                        'RESEARCH', 'My job is to know what the users wants'),
                    elementWidget('TESTING',
                        'Looking at numbers to prove success in usability'),
                  ],
                ),
              ),

              ///CERTIFICATE WIDGET
              LandingWidget(
                height: size.height * 0.6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Certificate',
                        style: AppTextStyle.mobileAnnotation
                            .copyWith(color: Palette.bgBlack),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        // height: size.height * 0.84,
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'GOOGLE UX DESIGN PROFESSIONAL CERTIFICATE',
                                    style: GoogleFonts.archivo(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w900,
                                        height: 0.86,
                                        letterSpacing: -1.42,
                                        color: Palette.bgBlack),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    children: [
                                      const Spacer(),
                                      YellowOutlinedButton(
                                        onTap: () {
                                          //TODO : Add Link for courseera
                                        },
                                        label: 'Verify >>',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              ///EXPERIENCE WIDGET
              LandingWidget(
                height: size.height * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'EXPERIENCE ',
                        style: AppTextStyle.mobileAnnotation
                            .copyWith(color: Palette.bgBlack),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Palette.bgBlack.withOpacity(0.3),
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 21),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '7months and counting',
                                style: AppTextStyle.mobileBody.copyWith(
                                    fontSize: 24,
                                    color: Palette.bgBlack.withOpacity(0.6)),
                              ),
                              Text(
                                'Solved more problems than just design ',
                                style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                    color: Palette.bgBlack),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Palette.bgBlack.withOpacity(0.3),
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 21),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '3years of Freelance',
                                style: AppTextStyle.mobileBody.copyWith(
                                    fontSize: 24,
                                    color: Palette.bgBlack.withOpacity(0.6)),
                              ),
                              Text(
                                'I learned to manage clients through dozens of projects',
                                style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                    color: Palette.bgBlack),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Palette.bgBlack.withOpacity(0.3),
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 21),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '3months of Internship',
                                style: AppTextStyle.mobileBody.copyWith(
                                    fontSize: 24,
                                    color: Palette.bgBlack.withOpacity(0.6)),
                              ),
                              Text(
                                'Taught me how to be efficient',
                                style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                    color: Palette.bgBlack),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Palette.bgBlack.withOpacity(0.3),
                              ),
                              bottom: BorderSide(
                                color: Palette.bgBlack.withOpacity(0.3),
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 21),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '1year of leadership',
                                style: AppTextStyle.mobileBody.copyWith(
                                    fontSize: 24,
                                    color: Palette.bgBlack.withOpacity(0.6)),
                              ),
                              Text(
                                'Mastering the art of Leadership and Collaboration',
                                style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                    color: Palette.bgBlack),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              ///EDUCATION WIDGET
              LandingWidget(
                height: size.height * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'EDUCATION',
                        style: AppTextStyle.mobileAnnotation
                            .copyWith(color: Palette.bgBlack),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Palette.bgBlack.withOpacity(0.3),
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 21),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'M.Des',
                                style: AppTextStyle.mobileBody.copyWith(
                                    fontSize: 24,
                                    color: Palette.bgBlack.withOpacity(0.6)),
                              ),
                              Text(
                                'kudos to my professors for making this a utopian reality.',
                                style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                    color: Palette.bgBlack),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Palette.bgBlack.withOpacity(0.3),
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 21),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'B.Tech',
                                style: AppTextStyle.mobileBody.copyWith(
                                    fontSize: 24,
                                    color: Palette.bgBlack.withOpacity(0.6)),
                              ),
                              Text(
                                'A place where I found my purpose',
                                style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                    color: Palette.bgBlack),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Palette.bgBlack.withOpacity(0.3),
                              ),
                              bottom: BorderSide(
                                color: Palette.bgBlack.withOpacity(0.3),
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 21),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'School',
                                style: AppTextStyle.mobileBody.copyWith(
                                    fontSize: 24,
                                    color: Palette.bgBlack.withOpacity(0.6)),
                              ),
                              Text(
                                'Exploring science, art and psychology',
                                style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                    color: Palette.bgBlack),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              ///PROJECTS WIDGET
              LandingWidget(
                color: Palette.hYellow,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PROJECTS ',
                        style: AppTextStyle.mobileAnnotation
                            .copyWith(color: Palette.bgBlack),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        // height: size.height * 0.84,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1, color: Palette.borderGrey)),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.065,
                                vertical: size.height * 0.0299,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'PORTFOLIO\nCASE STUDIES',
                                    style: GoogleFonts.archivo(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w900,
                                      // height: 0.86,
                                      letterSpacing: -1.42,
                                      color: Palette.bgBlack,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    children: [
                                      const Spacer(),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (c) =>
                                                      ProjectScreen()));
                                        },
                                        child: Container(
                                          width: 90,
                                          height: 24,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Palette.bgBlack),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'See all >>',
                                              style: AppTextStyle
                                                  .buttonTextStyle
                                                  .copyWith(
                                                      color: Palette.bgBlack),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Palette.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  CarouselSlider(
                                    items: images
                                        .map((e) => ProjectsCard(
                                            size: Size(size.width, size.height),
                                            url: e))
                                        .toList(),
                                    options: CarouselOptions(
                                      aspectRatio: 4 / 5,
                                      // viewportFraction: 0.8,
                                      initialPage: 0,
                                      enableInfiniteScroll: true,
                                      reverse: false,
                                      autoPlay: true,
                                      autoPlayInterval:
                                          const Duration(seconds: 2),
                                      autoPlayAnimationDuration:
                                          const Duration(seconds: 1),
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      enlargeCenterPage: true,
                                      enlargeFactor: 0.4,
                                      scrollDirection: Axis.horizontal,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              ///CORECOMPETENCY WIDGET
              ///WHATIDO WIDGET
              LandingWidget(
                height: size.height * 0.6,
                color: Palette.hYellow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'SKILLS',
                        style: AppTextStyle.mobileAnnotation
                            .copyWith(color: Palette.bgBlack),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    elementWidget(
                        'UX/UI DESIGN', 'Mostly designing websites and apps'),
                    elementWidget('SYSTEMS',
                        'Designing systems for the company to function efficiently'),
                    elementWidget('FACILITATION', 'Helping others, design'),
                    elementWidget(
                        'RESEARCH', 'My job is to know what the users wants'),
                    elementWidget('TESTING',
                        'Looking at numbers to prove success in usability'),
                  ],
                ),
              ),

              ///MOTO WIDGET
              LandingWidget(
                height: size.height * 0.6,
                color: Palette.hYellow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'MY MOTO',
                      style: AppTextStyle.mobileAnnotation
                          .copyWith(color: Palette.bgBlack),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      'SAME\nSTROKES FOR\nSIMILAR\nFOLKS',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.mobileHeading
                          .copyWith(color: Palette.bgBlack),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      '- MOHAMMAD ALI',
                      style: AppTextStyle.mobileAnnotation
                          .copyWith(color: Palette.bgBlack),
                    ),
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
                          ReqAnimatedTileContainer(
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
                          const ReqAnimatedTileContainer(
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

  Container elementWidget(String label, String subtext) {
    return Container(
      width: double.infinity,
      height: 64,
      decoration: BoxDecoration(
        color: Palette.hYellow,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Palette.white_30.withOpacity(0.2),
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
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
