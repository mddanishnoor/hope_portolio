import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/theme/pallete.dart';
import 'package:portfolio/providers/cursor_provider.dart';
import 'package:portfolio/providers/reqruiters_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/theme/styles.dart';
import '../../../core/widgets/landing_widget.dart';

class MyMoto extends StatelessWidget {
  const MyMoto({
    super.key,
    this.isRecruitment = false,
  });
  final bool isRecruitment;

  @override
  Widget build(BuildContext context) {
    return LandingWidget(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/png/moto_bg.png',
              ),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          MouseRegion(
            onEnter: (event) => isRecruitment
                ? context.read<RecruitersProvider>().toggleMagnify(true)
                : context.read<CursorProvider>().toggleMagnify(true),
            onExit: (event) => isRecruitment
                ? context.read<RecruitersProvider>().toggleMagnify(false)
                : context.read<CursorProvider>().toggleMagnify(false),
            child: Column(
              children: [
                Text('MY MOTO', style: AppTextStyle.annotation),
                const SizedBox(
                  height: 18,
                ),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'DIFFERENT\nSTROKES ',
                        style: AppTextStyle.heading,
                        children: [
                          TextSpan(
                            text: 'FOR',
                            style: AppTextStyle.heading
                                .copyWith(color: Palette.hYellow),
                          ),
                          const TextSpan(text: '\nDIFFERENT\nFOLKS')
                        ])),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  '- MOHAMMAD ALI',
                  style: AppTextStyle.annotation,
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class MobileMyMoto extends StatelessWidget {
  const MobileMyMoto({
    super.key,
    this.isRecruitment = false,
  });
  final bool isRecruitment;

  @override
  Widget build(BuildContext context) {
    return LandingWidget(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('MY MOTO', style: AppTextStyle.mobileAnnotation),
            const SizedBox(
              height: 18,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'DIFFERENT\nSTROKES ',
                    style: AppTextStyle.mobileHeading,
                    children: [
                      TextSpan(
                          text: 'FOR',
                          style: AppTextStyle.mobileHeading
                              .copyWith(color: Palette.hYellow)),
                      const TextSpan(text: '\nDIFFERENT\nFOLKS')
                    ])),
            // Text(
            //   'DIFFERENT\nSTROKES FOR',
            //   textAlign: TextAlign.center,
            //   style: AppTextStyle.mobileHeading,
            // ),
            const SizedBox(
              height: 18,
            ),
            Text(
              '- MOHAMMAD ALI',
              style: AppTextStyle.mobileAnnotation,
            ),
          ],
        ),
      ),
    );
  }
}
