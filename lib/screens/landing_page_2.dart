import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constant/theme/styles.dart';
import 'package:portfolio/providers/cursor_provider.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg.dart';

import '../core/constant/theme/pallete.dart';
import 'landing_page_1.dart';

class LandingPage2 extends StatelessWidget {
  const LandingPage2({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<CursorProvider>(builder: (context, controller, _) {
      return MouseFollower(
          controller.position,
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                LandingWidget(
                  color: Pallete.hYellow,
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
                            color: Pallete.bgBlack,
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
                              'RAZA MEANS HOPE',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.syne(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 0.8599999547,
                                letterSpacing: 4.32,
                                color: Pallete.bgBlack,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Text('DRIVER',
                                overflow: TextOverflow.fade,
                                style: AppTextStyle.heading),
                            Text(
                              'FOR COMPANY\nGROWTH',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.syne(
                                fontWeight: FontWeight.w700,
                                fontSize: 96,
                                height: 0.8599999746,
                                letterSpacing: -5.28,
                                color: Pallete.bgBlack,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                LandingWidget(
                    color: Pallete.hYellow,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.1046),
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
                              color: Pallete.bgBlack,
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
                                color: Pallete.bgBlack,
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
                                    color: Pallete.bgBlack,
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
                  color: Pallete.hYellow,
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
                            color: Pallete.bgBlack,
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
                            color: Pallete.bgBlack,
                          ),
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
                            color: Pallete.bgBlack,
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
                            color: Pallete.bgBlack,
                          ),
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
                            color: Pallete.bgBlack,
                          ),
                        ),
                      ),
                      const CustomDivider(),
                    ],
                  ),
                ),
                LandingWidget(
                  color: Pallete.hYellow,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.105),
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
                              border:
                                  Border.all(width: 1, color: Pallete.bgBlack)),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.065,
                                  vertical: size.height * 0.0299,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
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
                                        border:
                                            Border.all(color: Pallete.bgBlack),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'See all >>',
                                          style: GoogleFonts.syne(
                                              // 'Syne',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              height: 1,
                                              color: Pallete.bgBlack),
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
                                    borderRadius: BorderRadius.circular(10),
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
                  color: Pallete.hYellow,
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
                        'SAME\nSTROKES\nFOR SIMILAR\nFOLKS',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.syne(
                          // 'Syne',
                          fontSize: 96,
                          fontWeight: FontWeight.w700,
                          height: 0.8599999746,
                          letterSpacing: -5.28,
                          color: Pallete.bgBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                LandingWidget(
                  color: Pallete.hYellow,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.105),
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
                            color: Pallete.bgBlack,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12, right: 16),
                                      child: SvgPicture.asset(
                                        'svg/rectangle.svg',
                                        color: Pallete.bgBlack,
                                      ),
                                    ),
                                    Text(
                                      'LinkedIn',
                                      style: GoogleFonts.syne(
                                        // 'Syne',
                                        fontSize: 64,
                                        fontWeight: FontWeight.w600,
                                        height: 1.0049999952,
                                        color: Pallete.bgBlack,
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
                                          color: Pallete.bgBlack,
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
                                          color: Pallete.bgBlack,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12, right: 16),
                                      child: SvgPicture.asset(
                                        'svg/rectangle.svg',
                                        color: Pallete.bgBlack,
                                      ),
                                    ),
                                    Text(
                                      'Behance',
                                      style: GoogleFonts.syne(
                                        // 'Syne',
                                        fontSize: 64,
                                        fontWeight: FontWeight.w600,
                                        height: 1.0049999952,
                                        color: Pallete.bgBlack,
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
                                          color: Pallete.bgBlack,
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
                                          color: Pallete.bgBlack,
                                        ),
                                      ),
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
                          style: GoogleFonts.syne(
                            // 'Syne',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 0.8599999547,
                            letterSpacing: 4.32,
                            color: Pallete.bgBlack,
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
                                color: Pallete.bgBlack,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              // frame2ha7 (22:498)
                              margin: const EdgeInsets.fromLTRB(0, 15, 0, 12),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 12),

                              decoration: BoxDecoration(
                                color: Pallete.bgBlack,
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
                                    color: Pallete.hYellow,
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
          controller.isMagnified ? 200 : 50);
    });
  }
}
