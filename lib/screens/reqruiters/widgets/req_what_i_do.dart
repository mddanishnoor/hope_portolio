import 'package:flutter/material.dart';
import 'package:portfolio/providers/reqruiters_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/theme/styles.dart';
import '../../../core/widgets/black_tile.dart';
import '../../../core/widgets/landing_widget.dart';
import '../../../core/widgets/yellow_tile.dart';
import 'req_animated_tile.dart';

class ReqWhatIDoWidget extends StatefulWidget {
  const ReqWhatIDoWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<ReqWhatIDoWidget> createState() => _ReqWhatIDoWidgetState();
}

class _ReqWhatIDoWidgetState extends State<ReqWhatIDoWidget> {
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
                      'WHAT I DO',
                      style: AppTextStyle.annotation,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      ReqRunningAnimatedTileContainer(
                        multiplier: 1,
                        scrollOffset: provider.scrollOffset,
                        child1: BlackTileWidget(
                          size: widget.size,
                          label: 'UX/UI',
                        ),
                        child2: YellowTileWidget(
                          size: widget.size,
                          label: 'UX/UI',
                          secondLabel: 'Mostly designing websites and apps',
                        ),
                      ),
                      ReqRunningAnimatedTileContainer(
                        multiplier: 1.2,
                        scrollOffset: provider.scrollOffset,
                        child1: BlackTileWidget(
                          size: widget.size,
                          label: 'Systems',
                        ),
                        child2: YellowTileWidget(
                          size: widget.size,
                          label: 'Systems',
                          secondLabel:
                              'Designing systems for the company to function efficiently',
                        ),
                      ),
                      ReqRunningAnimatedTileContainer(
                        multiplier: 1.3,
                        scrollOffset: provider.scrollOffset,
                        child1: BlackTileWidget(
                          size: widget.size,
                          label: 'Facilitation',
                        ),
                        child2: YellowTileWidget(
                          size: widget.size,
                          label: 'Facilitation',
                          secondLabel: 'Helping others, design',
                        ),
                      ),
                      ReqRunningAnimatedTileContainer(
                        multiplier: 1.4,
                        scrollOffset: provider.scrollOffset,
                        child1: BlackTileWidget(
                          size: widget.size,
                          label: 'Research',
                        ),
                        child2: YellowTileWidget(
                          size: widget.size,
                          label: 'Research',
                          secondLabel: 'My job is to know what the users wants',
                        ),
                      ),
                      ReqRunningAnimatedTileContainer(
                        multiplier: 1.5,
                        scrollOffset: provider.scrollOffset,
                        child1: BlackTileWidget(
                          size: widget.size,
                          label: 'Testing',
                        ),
                        child2: YellowTileWidget(
                          size: widget.size,
                          label: 'Testing',
                          secondLabel:
                              'Looking at numbers to prove success in usability ',
                        ),
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Consumer<RecruitersProvider>(
            builder: (c, provider, _) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'WHAT I DO',
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
                      scrollOffset: provider.scrollOffset,
                      child: MobileBlackTileWidget(
                        size: widget.size,
                        label: 'UX/UI',
                      ),
                    ),
                    MobileReqRunningAnimatedTileContainer(
                      multiplier: 1.2,
                      scrollOffset: provider.scrollOffset,
                      child: MobileBlackTileWidget(
                        size: widget.size,
                        label: 'Systems',
                      ),
                    ),
                    MobileReqRunningAnimatedTileContainer(
                      multiplier: 1.3,
                      scrollOffset: provider.scrollOffset,
                      child: MobileBlackTileWidget(
                        size: widget.size,
                        label: 'Facilitation',
                      ),
                    ),
                    MobileReqRunningAnimatedTileContainer(
                      multiplier: 1.4,
                      scrollOffset: provider.scrollOffset,
                      child: MobileBlackTileWidget(
                        size: widget.size,
                        label: 'Research',
                      ),
                    ),
                    MobileReqRunningAnimatedTileContainer(
                      multiplier: 1.5,
                      scrollOffset: provider.scrollOffset,
                      child: MobileBlackTileWidget(
                        size: widget.size,
                        label: 'Testing',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          // const Spacer(),
        ],
      ),
    );
  }
}
