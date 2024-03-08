import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/providers/reqruiters_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/theme/pallete.dart';
import '../../../core/constant/theme/styles.dart';
import '../../../core/router/routes.dart';
import '../../../core/widgets/landing_widget.dart';

class HelpingUserWidget extends StatelessWidget {
  const HelpingUserWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return size.width > 600 ? webWidget(context) : mobileWidget(context);
  }

  LandingWidget webWidget(context) {
    return LandingWidget(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/png/recruiter_landing.png',
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
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  height: 0.8599999547,
                  color: Palette.white,
                ),
              ),
            ),
          ),
          Column(
            children: [
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: Consumer<RecruitersProvider>(
                    builder: (context, provider, _) {
                  return MouseRegion(
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
                              style: AppTextStyle.annotation),
                          const SizedBox(
                            height: 16,
                          ),
                          Text('HELPING\nUSERS',
                              textAlign: TextAlign.center,
                              style: AppTextStyle.heading),
                          Text('FLOW',
                              overflow: TextOverflow.fade,
                              style: AppTextStyle.heading
                                  .copyWith(color: Palette.hYellow)),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }

  LandingWidget mobileWidget(BuildContext context) {
    return LandingWidget(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/png/bg.png'), fit: BoxFit.fill)),
      child: Stack(
        children: [
          Positioned(
            left: size.height * 0.0241,
            top: size.height * 0.04,
            child: GestureDetector(
              onTap: () => context.goNamed(Routes.homeScreen),
              child: Text(
                'HOPE',
                textAlign: TextAlign.center,
                style: GoogleFonts.bebasNeue(
                  fontSize: 21.961,
                  fontWeight: FontWeight.w400,
                  height: 0.8599999547,
                  color: Palette.white,
                ),
              ),
            ),
          ),
          Column(
            children: [
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: Consumer<RecruitersProvider>(
                    builder: (context, provider, _) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('MOHAMMAD SAJJAD RAZA',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.mobileAnnotation),
                        const SizedBox(
                          height: 16,
                        ),
                        Text('HELPING\nUSERS',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.mobileHeading),
                        Text('FLOW',
                            overflow: TextOverflow.fade,
                            style: AppTextStyle.mobileHeading
                                .copyWith(color: Palette.hYellow)),
                      ],
                    ),
                  );
                }),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
