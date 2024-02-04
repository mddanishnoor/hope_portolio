import 'package:flutter/material.dart';
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
                Text('MY MOTO', style: AppTextStyle.anotation),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  'DIFFERENT\nSTROKES FOR\nDIFFERENT\nFOLKS',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.heading,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  '- MOHAMMAD ALI',
                  style: AppTextStyle.anotation,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // const Spacer(),
          Column(
            children: [
              Text('MY MOTO', style: AppTextStyle.mobileAnnotation),
              const SizedBox(
                height: 18,
              ),
              Text(
                'DIFFERENT\nSTROKES FOR\nDIFFERENT\nFOLKS',
                textAlign: TextAlign.center,
                style: AppTextStyle.mobileHeading,
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                '- MOHAMMAD ALI',
                style: AppTextStyle.mobileAnnotation,
              ),
            ],
          ),
          // const Spacer(),
        ],
      ),
    );
  }
}
