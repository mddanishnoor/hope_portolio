import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../core/constant/theme/pallete.dart';
import '../core/constant/theme/styles.dart';
import '../core/widgets/landing_widget.dart';

class ConnectWidget extends StatelessWidget {
  const ConnectWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return LandingWidget(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.105),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Connect',
              style: AppTextStyle.annotation,
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
                          padding: const EdgeInsets.only(top: 12, right: 16),
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
                          padding: const EdgeInsets.only(top: 12, right: 16),
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
              style: AppTextStyle.annotation,
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
                    color: Palette.notWhite,
                  ),
                ),
                const Spacer(),
                Container(
                  // frame2ha7 (22:498)
                  margin: const EdgeInsets.fromLTRB(0, 15, 0, 12),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),

                  decoration: BoxDecoration(
                    color: Palette.yellow,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      'Click here',
                      style: AppTextStyle.buttonTextStyle
                          .copyWith(color: Palette.bgBlack),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
