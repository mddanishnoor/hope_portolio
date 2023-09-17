import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constant/theme/pallete.dart';
import 'package:portfolio/core/constant/theme/styles.dart';
import 'package:portfolio/core/helper/clippers/circle_clipper.dart';
import 'package:portfolio/core/helper/navigation_bar.dart';
import 'package:portfolio/providers/cursor_provider.dart';
import 'package:portfolio/screens/landing_page_2.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg.dart';

class LandingPage1 extends StatelessWidget {
  LandingPage1({Key? key}) : super(key: key);
  final ScrollController scrollController = ScrollController();

  final ScrollController scrollController2 = ScrollController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<CursorProvider>(builder: (context, controller, _) {
      return Listener(
        // cursor: MouseCursor.uncontrolled,
        onPointerHover: (event) =>
            controller.updatePositioned(event.localPosition),
        child: Scaffold(
          backgroundColor: Pallete.black,
          body: NotificationListener<ScrollNotification>(
            child: Stack(
              children: [
                SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      LandingWidget(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('png/hero_bg.png'),
                              repeat: ImageRepeat.repeatY),
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
                                  // 'Bebas Neue',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w400,
                                  height: 0.8599999547,
                                  color: Pallete.white,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'MOHAMMAD SAJJAD RAZA',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.syne(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      height: 0.8599999547,
                                      letterSpacing: 4.32,
                                      color: Pallete.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text('ADVOCATE',
                                      overflow: TextOverflow.fade,
                                      style: AppTextStyle.heading
                                          .copyWith(color: Pallete.hYellow)),
                                  Text(
                                    'FOR\nUSERS',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.syne(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 96,
                                      height: 0.8599999746,
                                      letterSpacing: -5.28,
                                      color: Pallete.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      LandingWidget(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.1046),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ABOUT ME',
                              style: GoogleFonts.syne(
                                // 'Syne',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 0.8599999547,
                                letterSpacing: 4.32,
                                color: Pallete.white,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.syne(
                                  fontSize: 64,
                                  fontWeight: FontWeight.w600,
                                  height: 1.0049999952,
                                  color: Pallete.notWhite,
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'I am a ',
                                  ),
                                  TextSpan(
                                    text: 'multidisciplinary',
                                    style: GoogleFonts.syne(
                                      fontSize: 64,
                                      fontWeight: FontWeight.w600,
                                      height: 1.0049999952,
                                      color: Pallete.yellow,
                                    ),
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
                      )),
                      LandingWidget(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.105),
                              child: Text(
                                'WHAT I DO',
                                style: GoogleFonts.syne(
                                  // 'Syne',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  height: 0.8599999547,
                                  letterSpacing: 4.32,
                                  color: Pallete.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const CustomDivider(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.105),
                              child: Text(
                                'UX/UI Design',
                                style: GoogleFonts.syne(
                                    fontSize: 48,
                                    fontWeight: FontWeight.w800,
                                    height: 1.0049999555,
                                    color: Pallete.notWhite),
                              ),
                            ),
                            const CustomDivider(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.105),
                              child: Text(
                                'Design systems',
                                style: GoogleFonts.syne(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w800,
                                  height: 1.0049999555,
                                  color: Pallete.notWhite,
                                ),
                              ),
                            ),
                            const CustomDivider(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.105),
                              child: Text(
                                'UX Research',
                                style: GoogleFonts.syne(
                                    fontSize: 48,
                                    fontWeight: FontWeight.w800,
                                    height: 1.0049999555,
                                    color: Pallete.notWhite),
                              ),
                            ),
                            const CustomDivider(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.105),
                              child: Text(
                                'Design Facilitation',
                                style: GoogleFonts.syne(
                                    fontSize: 48,
                                    fontWeight: FontWeight.w800,
                                    height: 1.0049999555,
                                    color: Pallete.notWhite),
                              ),
                            ),
                            const CustomDivider(),
                          ],
                        ),
                      ),
                      LandingWidget(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.105),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PROJECTS ',
                                style: GoogleFonts.syne(
                                  // 'Syne',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  height: 0.8599999547,
                                  letterSpacing: 4.32,
                                  color: Pallete.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: size.height * 0.84,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1, color: Pallete.borderGrey)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.065,
                                        vertical: size.height * 0.0299,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'My favorite \nprojects',
                                            style: GoogleFonts.syne(
                                              // 'Syne',
                                              fontSize: 48,
                                              fontWeight: FontWeight.w800,
                                              height: 1.0049999952,
                                              color: Pallete.notWhite,
                                            ),
                                          ),
                                          const Spacer(),
                                          Container(
                                            width: 90,
                                            height: 24,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xfffbb023)),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'See all >>',
                                                style: GoogleFonts.syne(
                                                  // 'Syne',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  height: 1,
                                                  color: Color(0xfffbb023),
                                                ),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'MY MOTO',
                              style: GoogleFonts.syne(
                                // 'Syne',
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                height: 0.8599999547,
                                letterSpacing: 4.32,
                                color: Pallete.white,
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Text(
                              'DIFFERENT\nSTROKES FOR\nDIFFERENT\nFOLKS',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.syne(
                                // 'Syne',
                                fontSize: 96,
                                fontWeight: FontWeight.w700,
                                height: 0.8599999746,
                                letterSpacing: -5.28,
                                color: Pallete.notWhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                      LandingWidget(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.105),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Connect',
                                style: GoogleFonts.syne(
                                  // 'Syne',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  height: 0.8599999547,
                                  letterSpacing: 4.32,
                                  color: Pallete.white,
                                ),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 12, right: 16),
                                            child: SvgPicture.asset(
                                                'svg/rectangle.svg'),
                                          ),
                                          Text(
                                            'LinkedIn',
                                            style: GoogleFonts.syne(
                                              // 'Syne',
                                              fontSize: 64,
                                              fontWeight: FontWeight.w600,
                                              height: 1.0049999952,
                                              color: Pallete.notWhite,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      SizedBox(
                                        width: size.width * 0.168,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'EMAIL',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.syne(
                                                // 'Syne',
                                                fontSize: 17.4117641449,
                                                fontWeight: FontWeight.w700,
                                                height: 0.8599999518,
                                                letterSpacing: 4.7011763191,
                                                color: Pallete.white,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8.9,
                                            ),
                                            Text(
                                              'razamohdsajjad@gmail.com',
                                              style: GoogleFonts.syne(
                                                // 'Syne',
                                                fontSize: 17.4117641449,
                                                fontWeight: FontWeight.w400,
                                                height: 1,
                                                color: Pallete.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 12, right: 16),
                                            child: SvgPicture.asset(
                                                'svg/rectangle.svg'),
                                          ),
                                          Text(
                                            'Behance',
                                            style: GoogleFonts.syne(
                                              // 'Syne',
                                              fontSize: 64,
                                              fontWeight: FontWeight.w600,
                                              height: 1.0049999952,
                                              color: Pallete.notWhite,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      SizedBox(
                                        width: size.width * 0.168,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'PHONE',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.syne(
                                                // 'Syne',
                                                fontSize: 17.4117641449,
                                                fontWeight: FontWeight.w700,
                                                height: 0.8599999518,
                                                letterSpacing: 4.7011763191,
                                                color: Pallete.white,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8.9,
                                            ),
                                            Text(
                                              '+91 9818164010',
                                              style: GoogleFonts.poppins(
                                                // 'Poppins',
                                                fontSize: 15.2352933884,
                                                fontWeight: FontWeight.w400,
                                                height: 1,
                                                color: Pallete.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              /*
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'LinkedIn\nBehance',
                                    style: GoogleFonts.syne(
                                      // 'Syne',
                                      fontSize: 64,
                                      fontWeight: FontWeight.w600,
                                      height: 1.0049999952,
                                      color: Pallete.notWhite,
                                    ),
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'EMAIL',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.syne(
                                          // 'Syne',
                                          fontSize: 17.4117641449,
                                          fontWeight: FontWeight.w700,
                                          height: 0.8599999518,
                                          letterSpacing: 4.7011763191,
                                          color: Pallete.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8.9,
                                      ),
                                      Text(
                                        'razamohdsajjad@gmail.com',
                                        style: GoogleFonts.syne(
                                          // 'Syne',
                                          fontSize: 17.4117641449,
                                          fontWeight: FontWeight.w400,
                                          height: 1,
                                          color: Pallete.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 39,
                                      ),
                                      Text(
                                        'PHONE',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.syne(
                                          // 'Syne',
                                          fontSize: 17.4117641449,
                                          fontWeight: FontWeight.w700,
                                          height: 0.8599999518,
                                          letterSpacing: 4.7011763191,
                                          color: Pallete.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8.9,
                                      ),
                                      Text(
                                        '+91 9818164010',
                                        style: GoogleFonts.poppins(
                                          // 'Poppins',
                                          fontSize: 15.2352933884,
                                          fontWeight: FontWeight.w400,
                                          height: 1,
                                          color: Pallete.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),*/
                              SizedBox(
                                height: size.height * 0.2,
                              ),
                              Text(
                                'FOR REQRUITERS',
                                style: GoogleFonts.syne(
                                  // 'Syne',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  height: 0.8599999547,
                                  letterSpacing: 4.32,
                                  color: Pallete.white,
                                ),
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
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 15, 0, 12),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12),

                                    decoration: BoxDecoration(
                                      color: Pallete.yellow,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Click here',
                                        style: GoogleFonts.syne(
                                          // 'Syne',
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2941176471,
                                          letterSpacing: -0.400000006,
                                          color: Pallete.black,
                                        ),
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
                LandingPage2(
                  scrollController: scrollController2,
                ),
                const Align(
                    alignment: Alignment.bottomCenter, child: CustomNavbar())
              ],
            ),
            onNotification: (notification) {
              scrollController.jumpTo(scrollController2.offset);
              return true;
            },
          ),
        ),
      );
    });
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      color: Pallete.white_30,
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

  const MouseFollower(this.position, this.child, this.radius, {super.key})
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

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return ClipPath(
          clipper: CircleClipper(_positionTween!.evaluate(animation),
              _radiusTween!.evaluate(animation)),
          child: widget.child,
        );
      },
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
    /*visitor(
      _positionTween,
      widget.position,
      (value) => Tween<Offset>(
        begin: value,
      ),
    );*/
  }
}
