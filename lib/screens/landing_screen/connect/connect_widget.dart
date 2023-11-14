import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/screens/reqruiters/reqruiters_screen.dart';

import '../../../core/constant/theme/pallete.dart';
import '../../../core/constant/theme/styles.dart';
import '../../../core/widgets/animated_tile.dart';
import '../../../core/widgets/custom_elevated_button.dart';
import '../landing_page_1.dart';
import 'connect_tiles.dart';

class Connect extends StatelessWidget {
  const Connect({super.key, required this.size, this.isProject = false});

  final Size size;
  final bool isProject;

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
            Column(
              children: [
                ConnectTiles(
                  isProject: isProject,
                  title: 'LinkedIn',
                  subtitle: 'Work, work, work',
                  connectType: 'EMAIL',
                  value: 'razamohdsajjad@gmail.com',
                ),
                ConnectTiles(
                  isProject: isProject,
                  title: 'Behance',
                  subtitle: 'Another POV at my projects',
                  connectType: 'Phone',
                  value: '+91 9818164010',
                ),
                ConnectTiles(
                  isProject: isProject,
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
                  isProject: isProject,
                  child1: Text(
                    'If you like to hire me',
                    style: GoogleFonts.syne(
                      // 'Syne',
                      fontSize: 64,
                      fontWeight: FontWeight.w600,
                      height: 1.0049999952,
                      color: Palette.notWhite,
                    ),
                  ),
                  child2: ColoredBox(
                    color: Palette.hYellow,
                    child: Text(
                      'If you like to hire me',
                      style: GoogleFonts.syne(
                        // 'Syne',
                        fontSize: 64,
                        fontWeight: FontWeight.w600,
                        height: 1.0049999952,
                        color: Palette.bgBlack,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                AnimatedTileContainer(
                  isProject: isProject,
                  child1: CustomElevatedButton(
                    label: 'Click here',
                    isYellow: false,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RecruitersScreen(),
                        ),
                      );
                    },
                  ),
                  child2: CustomElevatedButton(
                    label: 'Click here',
                    isYellow: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RecruitersScreen(),
                        ),
                      );
                    },
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
