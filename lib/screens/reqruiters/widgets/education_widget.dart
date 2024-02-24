import 'package:flutter/material.dart';
import 'package:portfolio/providers/reqruiters_provider.dart';
import 'package:portfolio/screens/reqruiters/widgets/req_animated_tile.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/theme/pallete.dart';
import '../../../core/constant/theme/styles.dart';
import '../../../core/widgets/animated_tile.dart';
import '../../../core/widgets/landing_widget.dart';

class EducationWidget extends StatefulWidget {
  const EducationWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<EducationWidget> createState() => _EducationWidgetState();
}

class _EducationWidgetState extends State<EducationWidget> {
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
                      'EDUCATION ',
                      style: AppTextStyle.annotation,
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
                        child1: EducationTile(
                            size: widget.size,
                            timePeriod: 'Masters of Design',
                            position: '2021-23',
                            location:
                                'Department of Design and Innovation, J.M.I ',
                            subtext: ''),
                        child2: EducationTile(
                            isYellow: true,
                            size: widget.size,
                            timePeriod: 'M.Des',
                            position: '2021-23',
                            location:
                                'Department of Design and Innovation, J.M.I',
                            subtext:
                                'kudos to my professors for making this a utopian reality.'),
                      ),
                      RunningAnimatedTileContainer(
                        isRecruiter: true,
                        multiplier: 1.2,
                        scrollOffset: provider.scrollOffset,
                        child1: EducationTile(
                            size: widget.size,
                            timePeriod: 'Bachelor of Tech.',
                            position: '2017-21',
                            location: 'ADGITM - GGSIPU, Delhi ',
                            subtext: ''),
                        child2: EducationTile(
                            isYellow: true,
                            size: widget.size,
                            timePeriod: 'B.Tech',
                            position: '2017-21',
                            location: 'ADGITM - GGSIPU, Delhi ',
                            subtext: 'A place where I found my purpose'),
                      ),
                      RunningAnimatedTileContainer(
                        isRecruiter: true,
                        multiplier: 1.3,
                        scrollOffset: provider.scrollOffset,
                        child1: EducationTile(
                            size: widget.size,
                            timePeriod: 'Senior Secondary',
                            position: '2015-17',
                            location: 'Jamia Millia Islamia',
                            subtext:
                                'Mastering the art of Leadership and Collaboration '),
                        child2: EducationTile(
                            isYellow: true,
                            size: widget.size,
                            timePeriod: 'School',
                            position: '2015-17',
                            location: 'Jamia Millia Islamia',
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
                    'EDUCATION ',
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
                      height: 62,
                      scrollOffset: provider.scrollOffset,
                      child: MobileEducationTile(
                          size: widget.size,
                          timePeriod: '20 21-23',
                          position: 'Masters of Design',
                          location:
                              'Department of Design and Innovation, J.M.I ',
                          subtext: ''),
                    ),
                    MobileReqRunningAnimatedTileContainer(
                      multiplier: 1.2,
                      height: 62,
                      scrollOffset: provider.scrollOffset,
                      child: MobileEducationTile(
                          size: widget.size,
                          timePeriod: '20 17-21',
                          position: 'Bachelor of Technology',
                          location: 'ADGITM - GGSIPU, Delhi',
                          subtext: ''),
                    ),
                    MobileReqRunningAnimatedTileContainer(
                      multiplier: 1.3,
                      height: 62,
                      scrollOffset: provider.scrollOffset,
                      child: MobileEducationTile(
                          size: widget.size,
                          timePeriod: '20 15-17',
                          position: 'Senior Secondary',
                          location: 'Jamia Millia Islamia',
                          subtext: ''),
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

class EducationTile extends StatelessWidget {
  const EducationTile(
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
            // const SizedBox(
            //   width: 16,
            // ),
            Expanded(
                flex: isYellow ? 3 : 2,
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
            if (isYellow)
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

class MobileEducationTile extends StatelessWidget {
  const MobileEducationTile({
    super.key,
    required this.size,
    required this.timePeriod,
    required this.position,
    required this.location,
    required this.subtext,
  });
  final Size size;
  final String timePeriod;
  final String position;
  final String location;
  final String? subtext;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 65,
        decoration: const BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(
              color: Palette.white_30,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                // flex: 2,
                child: Text(position,
                    style: AppTextStyle.mobileBody.copyWith(fontSize: 24))),
            Expanded(
                // flex: 2,
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(
                        text: timePeriod.split(' ').first,
                        style: AppTextStyle.mobileBody.copyWith(
                            fontSize: 24,
                            color: Palette.hWhite.withOpacity(0.3)),
                        children: [
                      TextSpan(
                        text: timePeriod.split(' ').last,
                        style: AppTextStyle.mobileBody
                            .copyWith(fontSize: 24, color: Palette.hWhite),
                      )
                    ])),
                Text(
                  location,
                  style: AppTextStyle.anotationBody.copyWith(
                    fontSize: 11,
                    color: Palette.white_30,
                  ),
                )
              ],
            )),
          ],
        ));
  }
}
