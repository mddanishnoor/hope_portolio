import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constant/theme/pallete.dart';
import '../../../core/constant/theme/styles.dart';
import '../../../core/widgets/landing_widget.dart';

class VisitDesktop extends StatelessWidget {
  const VisitDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: LandingWidget(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/png/visit_desktop.png',
                ),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            Positioned(
              left: size.height * 0.0241,
              top: size.height * 0.063,
              child: GestureDetector(
                onTap: () => {},
                child: Text(
                  'HOPE',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.bebasNeue(
                    fontSize: 21,
                    fontWeight: FontWeight.w400,
                    height: 0.8599999547,
                    color: Palette.white,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                const Spacer(
                  flex: 3,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('MOBILE SITE\nUNDER CONSTRUCTION',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.mobileAnnotation),
                        const SizedBox(
                          height: 8,
                        ),
                        Text('VISIT',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.mobileHeading),
                        Text('DESKTOP',
                            overflow: TextOverflow.fade,
                            style: AppTextStyle.mobileHeading
                                .copyWith(color: Palette.hYellow)),
                        Text('VERSION',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.mobileHeading),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          '- MOHAMMAD SAJJAD RAZA',
                          style: AppTextStyle.mobileAnnotation,
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
