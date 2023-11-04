import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constant/theme/pallete.dart';
import 'package:portfolio/core/constant/theme/styles.dart';
import 'package:portfolio/core/helper/navigation_bar.dart';
import 'package:portfolio/core/widgets/animated_tile.dart';
import 'package:portfolio/core/widgets/running_text_widget.dart';
import 'package:portfolio/providers/cursor_provider.dart';
import 'package:portfolio/screens/landing_page_2.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg.dart';

import 'main_copy/favourite_projects.dart';

class LandingPage1 extends StatelessWidget {
  LandingPage1({Key? key}) : super(key: key);
  final ScrollController scrollController = ScrollController();

  final ScrollController scrollController2 = ScrollController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<CursorProvider>(builder: (context, controller, _) {
      return Scaffold(
        backgroundColor: Pallete.black,
        body: MouseRegion(
          onHover: (event) => controller.updatePositioned(event.position),
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              scrollController.jumpTo(scrollController2.offset);
              return true;
            },
            child: PrimaryScrollController(
              controller: scrollController2,
              child: Stack(
                children: [
                  MainCopy(size: size, scrollController2: scrollController2),
                  LandingPage2(
                    scrollController: scrollController,
                    scrollController2: scrollController2,
                  ),
                  if (scrollController2.hasClients &&
                      controller.scrollOffset >= (size.height / 2))
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomNavbar(
                          scrollController2,
                        ))
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class MainCopy extends StatelessWidget {
  const MainCopy({
    super.key,
    required this.size,
    required this.scrollController2,
  });

  final Size size;
  final ScrollController scrollController2;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: true,
      child: Consumer<CursorProvider>(builder: (context, provider, _) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            LandingWidget(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/png/hero_bg.jpeg'),
                    fit: BoxFit.cover),
              ),
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
                        color: Pallete.white,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const Spacer(),
                      Align(
                        alignment: Alignment.center,
                        child: MouseRegion(
                          onEnter: (event) => provider.toggleMagnify(true),
                          onExit: (event) => provider.toggleMagnify(false),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('MOHAMMAD SAJJAD RAZA',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.anotation),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text('ADVOCATE',
                                    overflow: TextOverflow.fade,
                                    style: AppTextStyle.heading
                                        .copyWith(color: Pallete.hYellow)),
                                Text('FOR\nUSERS',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.heading),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
            AboutMeWidget(
              size: size,
              scrollController: scrollController2,
            ),
            WhatIDoWidget(size: size, scrollController2: scrollController2),
            FavouriteProjects(size: size),
            LandingWidget(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  MouseRegion(
                    onEnter: (event) => provider.toggleMagnify(true),
                    onExit: (event) => provider.toggleMagnify(false),
                    child: Column(
                      children: [
                        Text('MY MOTO', style: AppTextStyle.anotation),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          'DIFFERENT\nSTROKES FOR\nDIFFERENT\nFOLKS',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.heading,
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
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.105),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Connect',
                      style: AppTextStyle.anotation,
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
                                  padding:
                                      const EdgeInsets.only(top: 12, right: 16),
                                  child: SvgPicture.asset('svg/rectangle.svg'),
                                ),
                                Text(
                                  'LinkedIn',
                                  style: AppTextStyle.body,
                                ),
                              ],
                            ),
                            const Spacer(),
                            SizedBox(
                              width: size.width * 0.18,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('EMAIL',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle.anotationBold),
                                  const SizedBox(
                                    height: 8.9,
                                  ),
                                  Text('razamohdsajjad@gmail.com',
                                      style: AppTextStyle.anotationBody),
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
                                  padding:
                                      const EdgeInsets.only(top: 12, right: 16),
                                  child: SvgPicture.asset('svg/rectangle.svg'),
                                ),
                                Text(
                                  'Behance',
                                  style: AppTextStyle.body,
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
                                    style: AppTextStyle.anotationBold,
                                  ),
                                  const SizedBox(
                                    height: 8.9,
                                  ),
                                  Text('+91 9818164010',
                                      style: AppTextStyle.anotationBody),
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
                      style: AppTextStyle.anotation,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          'If you like to hire me',
                          style: GoogleFonts.syne(
                            // 'Syne',
                            fontSize: 64,
                            fontWeight: FontWeight.w600,
                            height: 1.0049999952,
                            color: Pallete.notWhite,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          // frame2ha7 (22:498)
                          margin: const EdgeInsets.fromLTRB(0, 15, 0, 12),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),

                          decoration: BoxDecoration(
                            color: Pallete.yellow,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Text(
                              'Click here',
                              style: AppTextStyle.buttonTextStyle
                                  .copyWith(color: Pallete.bgBlack),
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
        );
      }),
    );
  }
}

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
  @override
  void initState() {
    widget.scrollController2.addListener(() {
      log("Height : ${widget.size.height}");
      log("Scroll Offset : ${widget.scrollController2.offset}");
      log("Offset/Height : ${(widget.scrollController2.offset / widget.size.height)}");
      log("(Offset/Height) * width : ${(widget.scrollController2.offset / widget.size.height) * widget.size.width}");
      log("__________________________________________________________________________");
      log((-(((widget.scrollController2.offset - (125 * 3))) *
              1.3 *
              (3 / widget.size.height) *
              widget.size.width))
          .toString());

      setState(() {});
    });
    super.initState();
  }

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
                      TileContainer(
                        multiplier: 1,
                        scrollOffset: widget.scrollController2.offset,
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
                      TileContainer(
                        multiplier: 1.2,
                        scrollOffset: widget.scrollController2.offset,
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
                      TileContainer(
                        multiplier: 1.3,
                        scrollOffset: widget.scrollController2.offset,
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
                      TileContainer(
                        multiplier: 1.4,
                        scrollOffset: widget.scrollController2.offset,
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
                      TileContainer(
                        multiplier: 1.5,
                        scrollOffset: widget.scrollController2.offset,
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

class AboutMeWidget extends StatefulWidget {
  const AboutMeWidget({
    super.key,
    required this.size,
    required this.scrollController,
  });

  final Size size;
  final ScrollController scrollController;

  @override
  State<AboutMeWidget> createState() => _AboutMeWidgetState();
}

class _AboutMeWidgetState extends State<AboutMeWidget> {
  // double _y = 0;
  @override
  void initState() {
    widget.scrollController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(() {});
    super.dispose();
  }

  GlobalKey widgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer<CursorProvider>(builder: (context, provider, _) {
      return LandingWidget(
          key: widgetKey,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: widget.size.width * 0.1046),
            child: Column(
              children: [
                const Spacer(),
                MouseRegion(
                  onEnter: (event) => provider.toggleMagnify(true),
                  onExit: (event) => provider.toggleMagnify(false),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ABOUT ME',
                          style: AppTextStyle.anotation,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        RunningText(
                          index: 1,
                          size: widget.size,
                          offset: widget.scrollController.offset,
                          maxLines: 5,
                          child: RichText(
                            text: TextSpan(
                              style: AppTextStyle.body,
                              children: [
                                const TextSpan(
                                  text: 'I am a ',
                                ),
                                TextSpan(
                                  text: 'multidisciplinary',
                                  style: AppTextStyle.body
                                      .copyWith(color: Pallete.hYellow),
                                ),
                                const TextSpan(
                                  text:
                                      ' designer creating inclusive experience through empathy and research.',
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ));
    });
  }
}

class YellowTileWidget extends StatelessWidget {
  const YellowTileWidget({
    super.key,
    required this.size,
    required this.label,
    required this.secondLabel,
  });

  final Size size;
  final String label;
  final String secondLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 65,
      decoration: const BoxDecoration(
        color: Pallete.hYellow,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Pallete.white_30,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.105,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: AppTextStyle.listExtended.copyWith(color: Pallete.bgBlack),
            ),
          ),
          // const Spacer(),
          Text(
            secondLabel,
            style: GoogleFonts.archivo(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Pallete.bgBlack),
          )
        ],
      ),
    );
  }
}

class BlackTileWidget extends StatelessWidget {
  const BlackTileWidget({
    super.key,
    required this.size,
    required this.label,
  });

  final Size size;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 65,
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Pallete.white_30,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.105,
      ),
      child: Text(
        label,
        style: AppTextStyle.listExtended,
      ),
    );
  }
}

class LandingWidget extends StatelessWidget {
  const LandingWidget({
    super.key,
    this.color,
    this.child,
    this.decoration,
  });
  final Color? color;
  final Widget? child;
  final Decoration? decoration;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: decoration,
      color: decoration == null ? color : null,
      child: child,
    );
  }
}
