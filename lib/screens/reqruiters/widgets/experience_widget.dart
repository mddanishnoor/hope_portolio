import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/providers/reqruiters_provider.dart';
import 'package:portfolio/screens/reqruiters/widgets/req_animated_tile.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/theme/pallete.dart';
import '../../../core/constant/theme/styles.dart';
import '../../../core/widgets/animated_tile.dart';
import '../../../core/widgets/landing_widget.dart';

class ExperienceWidget extends StatefulWidget {
  const ExperienceWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<ExperienceWidget> createState() => _ExperienceWidgetState();
}

class _ExperienceWidgetState extends State<ExperienceWidget> {
  GlobalKey widgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return widget.size.width > 600 ? webWidget() : mobileWidget();
  }

  LandingWidget webWidget() {
    return LandingWidget(
      child: Column(
        children: [
          const Spacer(),
          Consumer<RecruitersProvider>(
            builder: (c, provider, _) => MouseRegion(
              onEnter: (event) => provider.toggleHide(true),
              onExit: (event) => provider.toggleHide(false),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: widget.size.width * 0.105),
                    child: Text(
                      'EXPERIENCE ',
                      style: AppTextStyle.anotation,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      RunningAnimatedTileContainer(
                        isRecruiter: true,
                        multiplier: 1,
                        scrollOffset: provider.scrollOffset,
                        child1: ExperienceTile(
                            size: widget.size,
                            timePeriod: '2020-23',
                            position: 'Freelance',
                            location: 'India ',
                            subtext: ''),
                        child2: ExperienceTile(
                            isYellow: true,
                            size: widget.size,
                            timePeriod: '3 yrs',
                            position: 'Freelance',
                            location: 'India ',
                            subtext:
                                'I learned to manage clients through dozens of projects'),
                      ),
                      RunningAnimatedTileContainer(
                        isRecruiter: true,
                        multiplier: 1.2,
                        scrollOffset: provider.scrollOffset,
                        child1: ExperienceTile(
                            size: widget.size,
                            timePeriod: '06-09/21',
                            position: 'Graphic design intern',
                            location: 'Blue oktopus, Delhi NCR ',
                            subtext: ''),
                        child2: ExperienceTile(
                            isYellow: true,
                            size: widget.size,
                            timePeriod: '3 mos',
                            position: 'Graphic design intern',
                            location: 'Blue oktopus, Delhi NCR ',
                            subtext: 'Taught me how to be efficient'),
                      ),
                      RunningAnimatedTileContainer(
                        isRecruiter: true,
                        multiplier: 1.3,
                        scrollOffset: provider.scrollOffset,
                        child1: ExperienceTile(
                            size: widget.size,
                            timePeriod: '2019-21',
                            position: 'Design head',
                            location: 'IEEE, ADGITM, New Delhi ',
                            subtext:
                                'Mastering the art of Leadership and Collaboration '),
                        child2: ExperienceTile(
                            isYellow: true,
                            size: widget.size,
                            timePeriod: '1 yr ',
                            position: 'Design head',
                            location: 'India ',
                            subtext: 'Exploring science, art and psychology'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  LandingWidget mobileWidget() {
    return LandingWidget(
      height: widget.size.height * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<RecruitersProvider>(
            builder: (c, provider, _) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'EXPERIENCE ',
                    style: AppTextStyle.mobileAnnotation,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    MobileReqRunningAnimatedTileContainer(
                      multiplier: 1,
                      height: 54,
                      scrollOffset: provider.scrollOffset,
                      child: MobileExperienceTile(
                        size: widget.size,
                        timePeriod: 'NOW',
                        position: 'UX/UI DESG.',
                        location: 'GYMSAPIEN, New Delhi',
                      ),
                    ),
                    MobileReqRunningAnimatedTileContainer(
                      height: 78,
                      multiplier: 1.2,
                      scrollOffset: provider.scrollOffset,
                      child: MobileExperienceTile(
                        size: widget.size,
                        startTime: '2021',
                        timePeriod: '2023',
                        position: 'Freelance',
                        location: 'India',
                      ),
                    ),
                    MobileReqRunningAnimatedTileContainer(
                      multiplier: 1.3,
                      height: 78,
                      scrollOffset: provider.scrollOffset,
                      child: MobileExperienceTile(
                        size: widget.size,
                        timePeriod: '2023',
                        position: 'Graphic design intern',
                        location: 'Blue oktopus, Delhi NCR',
                      ),
                    ),
                    MobileReqRunningAnimatedTileContainer(
                      multiplier: 1.3,
                      height: 78,
                      scrollOffset: provider.scrollOffset,
                      child: MobileExperienceTile(
                        size: widget.size,
                        startTime: '2019',
                        timePeriod: '2021',
                        position: 'Design head',
                        location: 'IEEE, ADGITM, New Delhi ',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExperienceTile extends StatelessWidget {
  const ExperienceTile(
      {super.key,
      required this.size,
      required this.timePeriod,
      required this.position,
      required this.location,
      required this.subtext,
      this.isYellow = false});
  final Size size;
  final bool isYellow;
  final String timePeriod;
  final String position;
  final String location;
  final String? subtext;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(
            border: const Border.symmetric(
              horizontal: BorderSide(
                color: Palette.white_30,
              ),
            ),
            color: isYellow ? Palette.hYellow : null),
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.105,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 2,
                child: Text(
                  timePeriod,
                  style: AppTextStyle.body.copyWith(
                      fontSize: 45, color: isYellow ? Palette.black : null),
                )),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      position,
                      style: AppTextStyle.body.copyWith(
                          fontSize: 25, color: isYellow ? Palette.black : null),
                    ),
                    Text(
                      location,
                      style: AppTextStyle.anotationBody.copyWith(
                        fontSize: 16,
                        color: isYellow ? Palette.black : Palette.white_30,
                      ),
                    )
                  ],
                )),
            Expanded(
              flex: 3,
              child: Text(
                subtext ?? '',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Syne',
                    color: isYellow ? Palette.black : null),
              ),
            )
          ],
        ));
  }
}

class MobileExperienceTile extends StatelessWidget {
  const MobileExperienceTile(
      {super.key,
      required this.size,
      required this.timePeriod,
      required this.position,
      required this.location,
      this.startTime});
  final Size size;
  final String timePeriod;
  final String position;
  final String location;
  final String? startTime;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(
              color: Palette.white_30,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (startTime != null)
              Text(
                startTime!,
                style: AppTextStyle.mobileBody.copyWith(
                    fontSize: 24, color: Palette.hWhite.withOpacity(0.5)),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 2,
                    child: Text(
                      timePeriod,
                      style: AppTextStyle.mobileBody.copyWith(
                          fontSize: 24,
                          color: timePeriod == 'NOW' ? Palette.hYellow : null),
                    )),
                const SizedBox(
                  width: 36,
                ),
                Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          position,
                          style: AppTextStyle.mobileBody.copyWith(
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          location,
                          style: GoogleFonts.archivo(
                              fontSize: 11,
                              color: Palette.hWhite.withOpacity(0.5)),
                        )
                      ],
                    )),
              ],
            ),
          ],
        ));
  }
}
