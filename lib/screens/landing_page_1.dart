import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constant/theme/pallete.dart';

class LandingPage1 extends StatelessWidget {
  const LandingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallete.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            LandingWidget(
              color: Pallete.grey,
              child: Stack(
                children: [
                  Positioned(
                    left: 33,
                    top: 49,
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
                          height: 22,
                        ),
                        Text(
                          'ADVOCATE',
                          overflow: TextOverflow.fade,
                          style: GoogleFonts.syne(
                            fontSize: 96,
                            fontWeight: FontWeight.w700,
                            height: 0.8599999746,
                            letterSpacing: -5.28,
                            color: Pallete.yellow,
                          ),
                        ),
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
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.105),
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
                  Text(
                    'I am a multidisciplinary designer creating inclusive experience through empathy and research.',
                    style: GoogleFonts.syne(
                      fontSize: 64,
                      fontWeight: FontWeight.w600,
                      height: 1.0049999952,
                      color: Pallete.yellow,
                    ),
                  )
                ],
              ),
            )),
            LandingWidget(),
            LandingWidget(),
            LandingWidget(),
          ],
        ),
      ),
    );
  }
}

class LandingWidget extends StatelessWidget {
  const LandingWidget({
    super.key,
    this.color,
    this.child,
  });
  final Color? color;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: color,
      child: child,
    );
  }
}
