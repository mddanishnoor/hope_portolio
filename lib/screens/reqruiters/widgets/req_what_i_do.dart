import 'package:flutter/material.dart';
import 'package:portfolio/providers/reqruiters_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/theme/styles.dart';
import '../../../core/widgets/animated_tile.dart';
import '../../../core/widgets/black_tile.dart';
import '../../../core/widgets/landing_widget.dart';
import '../../../core/widgets/yellow_tile.dart';

class ReqWhatIDoWidget extends StatefulWidget {
  const ReqWhatIDoWidget({
    super.key,
    required this.size,
    required this.scrollController2,
  });

  final Size size;
  final ScrollController scrollController2;

  @override
  State<ReqWhatIDoWidget> createState() => _ReqWhatIDoWidgetState();
}

class _ReqWhatIDoWidgetState extends State<ReqWhatIDoWidget> {
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
                      'WHAT I DO',
                      style: AppTextStyle.anotation,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      RunningAnimatedTileContainer(
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
                      RunningAnimatedTileContainer(
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
                      RunningAnimatedTileContainer(
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
                      RunningAnimatedTileContainer(
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
                      RunningAnimatedTileContainer(
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
}
