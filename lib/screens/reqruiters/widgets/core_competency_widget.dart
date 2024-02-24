import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/theme/pallete.dart';
import 'package:portfolio/core/widgets/animated_tile.dart';
import 'package:portfolio/core/widgets/landing_widget.dart';
import 'package:portfolio/providers/reqruiters_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/theme/styles.dart';
import '../../../core/widgets/black_tile.dart';
import 'req_animated_tile.dart';

class CoreCompetency extends StatelessWidget {
  const CoreCompetency({super.key, required this.size, this.isYellow = false});

  final Size size;
  final bool isYellow;

  @override
  Widget build(BuildContext context) {
    return size.width > 600 ? webWidget() : mobileWidget();
  }

  LandingWidget webWidget() {
    return LandingWidget(
      child: Consumer<RecruitersProvider>(builder: (context, controller, _) {
        return MouseRegion(
          onEnter: (event) => controller.toggleHide(true),
          onExit: (event) => controller.toggleHide(false),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.105),
                child: Text(
                  'What I Do',
                  style: AppTextStyle.annotation,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RunningAnimatedTileContainer(
                isRecruiter: true,
                child1: Container(
                  height: 65,
                  width: double.infinity,
                  alignment: Alignment.bottomLeft,
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: Palette.white_30,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.105,
                  ),
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: 'UX',
                      style: AppTextStyle.heading
                          .copyWith(fontSize: 64, color: Palette.hYellow),
                      children: [
                        TextSpan(
                          text: '/UI DESIGN',
                          style: AppTextStyle.heading.copyWith(
                            fontSize: 64,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                child2: YellowTile(
                  size: size,
                  title: 'UX/UI DESIGN',
                  subtext: 'Its more than just websites and apps',
                ),
                scrollOffset: controller.scrollOffset,
                multiplier: 1,
              ),

              ///

              RunningAnimatedTileContainer(
                isRecruiter: true,
                child1: Container(
                  height: 65,
                  width: double.infinity,
                  alignment: Alignment.bottomLeft,
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: Palette.white_30,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.105,
                  ),
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: 'UX  R',
                      style: AppTextStyle.heading
                          .copyWith(fontSize: 64, color: Palette.hYellow),
                      children: [
                        TextSpan(
                          text: ' ESEARCH ',
                          style: AppTextStyle.heading.copyWith(
                            fontSize: 64,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                child2: YellowTile(
                  size: size,
                  title: 'UX RESEARCH     ',
                  subtext: 'Understanding and empathizing with the users ',
                ),
                scrollOffset: controller.scrollOffset,
                multiplier: 1.2,
              ),
              //
              RunningAnimatedTileContainer(
                isRecruiter: true,
                child1: Container(
                  height: 65,
                  width: double.infinity,
                  alignment: Alignment.bottomLeft,
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: Palette.white_30,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.105,
                  ),
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: 'UX ',
                      style: AppTextStyle.heading.copyWith(
                        fontSize: 64,
                      ),
                      children: [
                        TextSpan(
                          text: 'STRATEGY ',
                          style: AppTextStyle.heading
                              .copyWith(fontSize: 64, color: Palette.hYellow),
                        ),
                      ],
                    ),
                  ),
                  //  Text(
                  //   'WIREFRAMING',
                  //   style: AppTextStyle.heading.copyWith(
                  //     fontSize: 64,
                  //   ),
                  // ),
                ),
                child2: YellowTile(
                  size: size,
                  title: 'UX STRATEGY',
                  subtext: 'Developing a process to achieve goals ',
                ),
                scrollOffset: controller.scrollOffset,
                multiplier: 1,
              ),
              //
              RunningAnimatedTileContainer(
                isRecruiter: true,
                child1: Container(
                  height: 65,
                  width: double.infinity,
                  alignment: Alignment.bottomLeft,
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: Palette.white_30,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.105,
                  ),
                  child: Text(
                    'WIREFRAMING',
                    style: AppTextStyle.heading.copyWith(
                      fontSize: 64,
                    ),
                  ),
                ),
                child2: YellowTile(
                  size: size,
                  title: 'WIREFRAMING ',
                  subtext:
                      'Getting everybody onboard before investing in an idea ',
                ),
                scrollOffset: controller.scrollOffset,
                multiplier: 1,
              ),
              //
              RunningAnimatedTileContainer(
                isRecruiter: true,
                child1: Container(
                  height: 65,
                  width: double.infinity,
                  alignment: Alignment.bottomLeft,
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: Palette.white_30,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.105,
                  ),
                  child: Text(
                    'INFORMATION ARCH.',
                    style: AppTextStyle.heading.copyWith(
                      fontSize: 64,
                    ),
                  ),
                ),
                child2: YellowTile(
                  size: size,
                  title: 'INFO. ARCH.',
                  subtext: 'Helping users flow ',
                ),
                scrollOffset: controller.scrollOffset,
                multiplier: 1,
              ),
              //
              RunningAnimatedTileContainer(
                isRecruiter: true,
                child1: Container(
                  height: 65,
                  width: double.infinity,
                  alignment: Alignment.bottomLeft,
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: Palette.white_30,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.105,
                  ),
                  child: Text(
                    'DESIGN FACILITATION',
                    style: AppTextStyle.heading.copyWith(
                      fontSize: 64,
                    ),
                  ),
                ),
                child2: YellowTile(
                  size: size,
                  title: 'DESIGN FACIL. ',
                  subtext: 'Because its not a one man job                  ',
                ),
                scrollOffset: controller.scrollOffset,
                multiplier: 1,
              ),
              //
              RunningAnimatedTileContainer(
                isRecruiter: true,
                child1: Container(
                  height: 65,
                  width: double.infinity,
                  alignment: Alignment.bottomLeft,
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: Palette.white_30,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.105,
                  ),
                  child: Text(
                    'DESIGN THINKING',
                    style: AppTextStyle.heading
                        .copyWith(fontSize: 64, color: Palette.hYellow),
                  ),
                ),
                child2: YellowTile(
                  size: size,
                  title: 'DESIGN THINKING',
                  subtext: 'A cognitive, strategic and practical process',
                ),
                scrollOffset: controller.scrollOffset,
                multiplier: 1,
              ),
            ],
          ),
        );
      }),
    );
  }

  LandingWidget mobileWidget() {
    return LandingWidget(
      height: size.height * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Text(
              'SKILLS',
              style: AppTextStyle.mobileAnnotation,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer<RecruitersProvider>(builder: (context, provider, _) {
            return Column(
              children: [
                MobileReqRunningAnimatedTileContainer(
                  multiplier: 1,
                  // height: 62,
                  scrollOffset: provider.scrollOffset,
                  child: MobileBlackTileWidget(
                    size: size,
                    label: 'UX/UI DESIGN',
                  ),
                ),
                MobileReqRunningAnimatedTileContainer(
                  multiplier: 1.1,
                  // height: 62,
                  scrollOffset: provider.scrollOffset,
                  child: MobileBlackTileWidget(
                    size: size,
                    label: 'UX RESEARCH',
                  ),
                ),
                MobileReqRunningAnimatedTileContainer(
                  multiplier: 1.2,
                  // height: 62,
                  scrollOffset: provider.scrollOffset,
                  child: MobileBlackTileWidget(
                    size: size,
                    label: 'UX STRATEGY',
                  ),
                ),
                MobileReqRunningAnimatedTileContainer(
                  multiplier: 1.3,
                  // height: 62,
                  scrollOffset: provider.scrollOffset,
                  child: MobileBlackTileWidget(
                    size: size,
                    label: 'WIREFRAMING',
                  ),
                ),
                MobileReqRunningAnimatedTileContainer(
                  multiplier: 1.4,
                  // height: 62,
                  scrollOffset: provider.scrollOffset,
                  child: MobileBlackTileWidget(
                    size: size,
                    label: 'INFO. ARCH.',
                  ),
                ),
                MobileReqRunningAnimatedTileContainer(
                  multiplier: 1.5,
                  // height: 62,
                  scrollOffset: provider.scrollOffset,
                  child: MobileBlackTileWidget(
                    size: size,
                    label: 'DESIGN FACIL.',
                  ),
                ),
                MobileReqRunningAnimatedTileContainer(
                  multiplier: 1.6,
                  // height: 62,
                  scrollOffset: provider.scrollOffset,
                  child: MobileBlackTileWidget(
                    size: size,
                    label: 'DESIGN THINKING',
                  ),
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}

class YellowTile extends StatelessWidget {
  const YellowTile({
    super.key,
    required this.size,
    required this.title,
    required this.subtext,
  });

  final Size size;
  final String title, subtext;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      alignment: Alignment.bottomLeft,
      decoration: const BoxDecoration(color: Palette.hYellow),
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.105,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              title,
              style: AppTextStyle.heading
                  .copyWith(fontSize: 64, color: Palette.black),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              subtext,
              style: AppTextStyle.listTileSubtextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
