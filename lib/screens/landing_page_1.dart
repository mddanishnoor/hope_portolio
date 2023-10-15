import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constant/theme/pallete.dart';
import 'package:portfolio/core/constant/theme/styles.dart';
import 'package:portfolio/core/helper/clippers/circle_clipper.dart';
import 'package:portfolio/core/helper/navigation_bar.dart';
import 'package:portfolio/core/widgets/animated_tile.dart';
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
            LandingWidget(
              child: Column(
                children: [
                  const Spacer(),
                  MouseRegion(
                    onEnter: (event) => provider.toggleHide(true),
                    onExit: (event) => provider.toggleHide(false),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.105),
                          child: Text(
                            'WHAT I DO',
                            style: AppTextStyle.anotation,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TileContainer(
                          child1: BlackTileWidget(
                            size: size,
                            label: 'UX/UI Design',
                          ),
                          child2: YellowTileWidget(
                            size: size,
                            label: 'UX/UI Design',
                          ),
                        ),
                        TileContainer(
                          child1: BlackTileWidget(
                            size: size,
                            label: 'Design systems',
                          ),
                          child2: YellowTileWidget(
                            size: size,
                            label: 'Design systems',
                          ),
                        ),
                        TileContainer(
                          child1: BlackTileWidget(
                            size: size,
                            label: 'UX Research',
                          ),
                          child2: YellowTileWidget(
                            size: size,
                            label: 'UX Research',
                          ),
                        ),
                        TileContainer(
                          child1: BlackTileWidget(
                            size: size,
                            label: 'Design Facilitation',
                          ),
                          child2: YellowTileWidget(
                            size: size,
                            label: 'Design Facilitation',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
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
      log("Scroll Offset : ${widget.scrollController.offset}");
      log("Offset/Height : ${(widget.scrollController.offset / widget.size.height)}");
      log("(Offset/Height) * width : ${(widget.scrollController.offset / widget.size.height) * widget.size.width}");
      log("__________________________________________________________________________");
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CursorProvider>(builder: (context, provider, _) {
      return LandingWidget(
          key: const GlobalObjectKey('aboutme'),
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
                        Stack(
                          children: [
                            Wrap(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'I am a ',
                                      style: AppTextStyle.body,
                                    ),
                                    Text('multidisciplinary ',
                                        style: AppTextStyle.body
                                            .copyWith(color: Pallete.hYellow)),
                                  ],
                                ),
                                Text(
                                  'designer creating inclusive ',
                                  style: AppTextStyle.body,
                                ),
                                Text(
                                  'experience through empathy and research.',
                                  style: AppTextStyle.body,
                                ),
                                // ),
                              ],
                            ),
                            AnimatedPositioned(
                              duration: const Duration(milliseconds: 200),
                              right:
                                  -(((((widget.scrollController.offset - 250) *
                                                  1.3) /
                                              widget.size.height) *
                                          3) *
                                      widget.size.width),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: (widget.size.width * 0.8),
                                      height: 62,
                                      decoration: BoxDecoration(
                                        backgroundBlendMode: BlendMode.darken,
                                        color: Pallete.bgBlack.withOpacity(0.5),
                                      ),
                                    ),
                                    Container(
                                      width: (widget.size.width * 0.8) * 2,
                                      height: 62,
                                      decoration: BoxDecoration(
                                        backgroundBlendMode: BlendMode.darken,
                                        color: Pallete.bgBlack.withOpacity(0.5),
                                      ),
                                    ),
                                    Container(
                                      width: (widget.size.width * 0.8) * 3,
                                      height: 62,
                                      decoration: BoxDecoration(
                                        backgroundBlendMode: BlendMode.darken,
                                        color: Pallete.bgBlack.withOpacity(0.5),
                                      ),
                                    ),
                                    Container(
                                      width: (widget.size.width * 0.8) * 4,
                                      height: 62,
                                      decoration: BoxDecoration(
                                        backgroundBlendMode: BlendMode.darken,
                                        color: Pallete.bgBlack.withOpacity(0.5),
                                      ),
                                    )
                                  ]),
                            )
                          ],
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
  });

  final Size size;
  final String label;

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
      child: Text(
        label,
        style: AppTextStyle.listExtended.copyWith(color: Pallete.bgBlack),
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

class MouseFollower extends ImplicitlyAnimatedWidget {
  final Offset position;
  final Widget child;
  final double radius;
  final double height;
  final double width;

  const MouseFollower(
      {required this.position,
      required this.child,
      required this.radius,
      required this.height,
      required this.width,
      super.key})
      : super(
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 300),
        );

  @override
  ImplicitlyAnimatedWidgetState createState() => _MouseFollowerState();
}

class _MouseFollowerState extends AnimatedWidgetBaseState<MouseFollower> {
  Tween<Offset>? _positionTween;
  Tween<double>? _radiusTween;
  Tween<double>? _heightTween;
  Tween<double>? _widthTween;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CircleClipper(
          _positionTween!
              .chain(CurveTween(curve: Curves.easeIn))
              .evaluate(animation),
          _radiusTween!
              .chain(CurveTween(curve: Curves.easeIn))
              .evaluate(animation)),
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    _positionTween = (visitor(_positionTween, widget.position,
            (dynamic value) => Tween<Offset>(begin: value as Offset))
        as Tween<Offset>?)!;
    _radiusTween = (visitor(_radiusTween, widget.radius,
            (dynamic value) => Tween<double>(begin: value as double))
        as Tween<double>?);
    _heightTween = (visitor(_heightTween, widget.height,
            (dynamic value) => Tween<double>(begin: value as double))
        as Tween<double>?)!;
    _widthTween = (visitor(_widthTween, widget.width,
            (dynamic value) => Tween<double>(begin: value as double))
        as Tween<double>?);
  }
}
