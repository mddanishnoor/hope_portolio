import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/theme/styles.dart';
import '../../../core/widgets/animated_tile.dart';
import '../../../core/widgets/black_tile.dart';
import '../../../core/widgets/landing_widget.dart';
import '../../../core/widgets/yellow_tile.dart';
import '../../../providers/cursor_provider.dart';

class WhatIDoWidget extends StatefulWidget {
  const WhatIDoWidget({
    super.key,
    required this.size,
    required this.scrollController2,
  });

  final Size size;
  final ScrollController scrollController2;

  @override
  State<WhatIDoWidget> createState() => _WhatIDoWidgetState();
}

class _WhatIDoWidgetState extends State<WhatIDoWidget> {
  GlobalKey widgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return LandingWidget(
      child: Column(
        children: [
          const Spacer(),
          Consumer<CursorProvider>(
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

class MobileWhatIDoWidget extends StatefulWidget {
  const MobileWhatIDoWidget({
    super.key,
    required this.size,
    required this.scrollController2,
  });

  final Size size;
  final ScrollController scrollController2;

  @override
  State<MobileWhatIDoWidget> createState() => _MobileWhatIDoWidgetState();
}

class _MobileWhatIDoWidgetState extends State<MobileWhatIDoWidget> {
  GlobalKey widgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return LandingWidget(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const Spacer(),
          Consumer<CursorProvider>(
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
                      style: AppTextStyle.mobileAnnotation,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      MobileBlackTileWidget(
                        size: widget.size,
                        label: 'UX/UI',
                      ),
                      MobileBlackTileWidget(
                        size: widget.size,
                        label: 'SYSTEMS',
                      ),
                      MobileBlackTileWidget(
                        size: widget.size,
                        label: 'FACILITATION',
                      ),
                      MobileBlackTileWidget(
                        size: widget.size,
                        label: 'RESEARCH',
                      ),
                      MobileBlackTileWidget(
                        size: widget.size,
                        label: 'TESTING',
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          // const Spacer(),
        ],
      ),
    );
  }
}
