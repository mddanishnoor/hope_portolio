import 'package:flutter/material.dart';
import 'package:portfolio/providers/reqruiters_provider.dart';
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
