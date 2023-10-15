// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constant/theme/styles.dart';
import 'package:portfolio/providers/cursor_provider.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg.dart';

import '../core/constant/theme/pallete.dart';
// import '../core/widgets/animated_tile.dart';
import 'landing_page_1.dart';

class LandingPage2 extends StatelessWidget {
  const LandingPage2({
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
            child: LandingPage2Child(
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
        color: Pallete.hYellow,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              LandingWidget(
                color: Pallete.hYellow,
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
                          color: Pallete.bgBlack,
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
                                .read<CursorProvider>()
                                .toggleMagnify(true),
                            onExit: (event) => context
                                .read<CursorProvider>()
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
                                        .copyWith(color: Pallete.bgBlack),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    'DRIVER',
                                    overflow: TextOverflow.fade,
                                    style: AppTextStyle.heading
                                        .copyWith(color: Pallete.bgBlack),
                                  ),
                                  Text(
                                    'FOR COMPANY\nGROWTH',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.heading
                                        .copyWith(color: Pallete.bgBlack),
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
                  color: Pallete.hYellow,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.1046),
                    child: Column(
                      children: [
                        const Spacer(),
                        MouseRegion(
                          onEnter: (event) => context
                              .read<CursorProvider>()
                              .toggleMagnify(true),
                          onExit: (event) => context
                              .read<CursorProvider>()
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
                                      .copyWith(color: Pallete.bgBlack),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: AppTextStyle.body
                                        .copyWith(color: Pallete.bgBlack),
                                    children: [
                                      const TextSpan(
                                        text: 'I am a ',
                                      ),
                                      TextSpan(
                                        text: 'multidisciplinary',
                                        style: AppTextStyle.body
                                            .copyWith(color: Pallete.bgBlack),
                                      ),
                                      const TextSpan(
                                        text:
                                            ' designer creating inclusive experience through empathy and research.',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  )),
              LandingWidget(
                color: Pallete.hYellow,
                child: Column(
                  children: [
                    const Spacer(),
                    MouseRegion(
                      onEnter: (event) =>
                          context.read<CursorProvider>().toggleHide(true),
                      onExit: (event) =>
                          context.read<CursorProvider>().toggleHide(false),
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
                                  .copyWith(color: Pallete.bgBlack),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          YellowTileWidget(
                            size: size,
                            label: 'UX/UI Design',
                          ),
                          YellowTileWidget(
                            size: size,
                            label: 'Design systems',
                          ),
                          YellowTileWidget(
                            size: size,
                            label: 'UX Research',
                          ),
                          YellowTileWidget(
                            size: size,
                            label: 'Design Facilitation',
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              LandingWidget(
                color: Pallete.hYellow,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.105),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PROJECTS ',
                        style: AppTextStyle.anotation
                            .copyWith(color: Pallete.bgBlack),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: size.height * 0.84,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(width: 1, color: Pallete.bgBlack)),
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
                                        .copyWith(color: Pallete.bgBlack),
                                  ),
                                  const Spacer(),
                                  Container(
                                    width: 90,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Pallete.bgBlack),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'See all >>',
                                        style: AppTextStyle.buttonTextStyle
                                            .copyWith(color: Pallete.bgBlack),
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
                                  color: Pallete.grey,
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
                color: Pallete.hYellow,
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
                                .copyWith(color: Pallete.bgBlack),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Text(
                            'SAME\nSTROKES FOR\nSIMILAR\nFOLKS',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.heading
                                .copyWith(color: Pallete.bgBlack),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              LandingWidget(
                color: Pallete.hYellow,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.105),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Connect',
                        style: AppTextStyle.anotation
                            .copyWith(color: Pallete.bgBlack),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12, right: 16),
                                    child: SvgPicture.asset(
                                      'svg/rectangle.svg',
                                      color: Pallete.bgBlack,
                                    ),
                                  ),
                                  Text(
                                    'LinkedIn',
                                    style: AppTextStyle.body
                                        .copyWith(color: Pallete.bgBlack),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              SizedBox(
                                width: size.width * 0.18,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'EMAIL',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle.anotationBold
                                          .copyWith(color: Pallete.bgBlack),
                                    ),
                                    const SizedBox(
                                      height: 8.9,
                                    ),
                                    Text(
                                      'razamohdsajjad@gmail.com',
                                      style: AppTextStyle.anotationBody
                                          .copyWith(color: Pallete.bgBlack),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12, right: 16),
                                    child: SvgPicture.asset(
                                      'svg/rectangle.svg',
                                      color: Pallete.bgBlack,
                                    ),
                                  ),
                                  Text(
                                    'Behance',
                                    style: AppTextStyle.body
                                        .copyWith(color: Pallete.bgBlack),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              SizedBox(
                                width: size.width * 0.18,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'PHONE',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle.anotationBold
                                          .copyWith(color: Pallete.bgBlack),
                                    ),
                                    const SizedBox(
                                      height: 8.9,
                                    ),
                                    Text(
                                      '+91 9818164010',
                                      style: AppTextStyle.anotationBody
                                          .copyWith(color: Pallete.bgBlack),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.2,
                      ),
                      Text(
                        'FOR REQRUITERS',
                        style: AppTextStyle.anotation
                            .copyWith(color: Pallete.bgBlack),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Text(
                            'If you like to hire me',
                            style: AppTextStyle.body
                                .copyWith(color: Pallete.bgBlack),
                          ),
                          const Spacer(),
                          Container(
                            // frame2ha7 (22:498)
                            margin: const EdgeInsets.fromLTRB(0, 15, 0, 12),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),

                            decoration: BoxDecoration(
                              color: Pallete.bgBlack,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: Text(
                                'Click here',
                                style: AppTextStyle.buttonTextStyle,
                              ),
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
