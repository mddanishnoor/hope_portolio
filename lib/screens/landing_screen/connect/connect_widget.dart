import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constant/theme/pallete.dart';
import '../../../core/constant/theme/styles.dart';
import '../../../core/widgets/animated_tile.dart';
import '../../../core/widgets/custom_elevated_button.dart';
import '../landing_page_1.dart';
import 'connect_tiles.dart';

class Connect extends StatelessWidget {
  const Connect({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return LandingWidget(
      child: Padding(
        padding:
            EdgeInsets.only(left: size.width * 0.105, right: size.width * 0.08),
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
            const Column(
              children: [
                ConnectTiles(
                  title: 'LinkedIn',
                  subtitle: 'Work, work, work',
                  connectType: 'EMAIL',
                  value: 'razamohdsajjad@gmail.com',
                ),
                ConnectTiles(
                  title: 'Behance',
                  subtitle: 'Another POV at my projects',
                  connectType: 'Phone',
                  value: '+91 9818164010',
                ),
                ConnectTiles(
                  title: 'Instagram',
                  subtitle: 'My inactive social face',
                  connectType: 'Phone',
                  value: '+91 9818164010',
                  hasConnectValue: false,
                ),
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
                AnimatedTileContainer(
                  child1: Text(
                    'If you like to hire me',
                    style: GoogleFonts.syne(
                      // 'Syne',
                      fontSize: 64,
                      fontWeight: FontWeight.w600,
                      height: 1.0049999952,
                      color: Pallete.notWhite,
                    ),
                  ),
                  child2: ColoredBox(
                    color: Pallete.hYellow,
                    child: Text(
                      'If you like to hire me',
                      style: GoogleFonts.syne(
                        // 'Syne',
                        fontSize: 64,
                        fontWeight: FontWeight.w600,
                        height: 1.0049999952,
                        color: Pallete.bgBlack,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                const AnimatedTileContainer(
                  child1: CustomElevatedButton(
                    label: 'Click here',
                    isYellow: false,
                  ),
                  child2: CustomElevatedButton(
                    label: 'Click here',
                    isYellow: true,
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
