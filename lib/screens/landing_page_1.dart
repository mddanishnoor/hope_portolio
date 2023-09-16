import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constant/theme/pallete.dart';
import 'package:portfolio/core/constant/theme/styles.dart';
import 'package:portfolio/core/helper/navigation_bar.dart';

class LandingPage1 extends StatelessWidget {
  const LandingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallete.black,
      body: Stack(
        children: [
          SingleChildScrollView(
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
                              border: Border.all(
                                  width: 1, color: Pallete.borderGrey)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: size.height * 0.041,
                                          left: size.width * 0.0329),
                                      child: Text(
                                        'My \nfavorite \nprojects',
                                        style: GoogleFonts.syne(
                                          // 'Syne',
                                          fontSize: 64,
                                          fontWeight: FontWeight.w800,
                                          height: 1.0049999952,
                                          color: Pallete.notWhite,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: size.height * 0.84,
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
                            color: Pallete.white,
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
          const Align(alignment: Alignment.bottomCenter, child: CustomNavbar())
        ],
      ),
    );
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
      color: Pallete.white,
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
