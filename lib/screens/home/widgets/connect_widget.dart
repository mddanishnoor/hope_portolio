import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constant/theme/pallete.dart';
import '../../../core/constant/theme/styles.dart';
import '../../../core/router/routes.dart';
import '../../../core/widgets/animated_tile.dart';
import '../../../core/widgets/custom_elevated_button.dart';
import '../../../core/widgets/landing_widget.dart';
import '../../reqruiters/widgets/certifcate_widget.dart';
import 'connect_tiles.dart';

class Connect extends StatelessWidget {
  const Connect(
      {super.key,
      required this.size,
      this.isProject = false,
      this.isRecruiter = false});

  final Size size;
  final bool isProject;
  final bool isRecruiter;

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
                  isRecruiter: isRecruiter,
                  title: 'LinkedIn',
                  subtitle: 'Work, work, work',
                  connectType: 'EMAIL',
                  value: 'razamohdsajjad@gmail.com',
                ),
                ConnectTiles(
                  isProject: isProject,
                  isRecruiter: isRecruiter,
                  title: 'Behance',
                  subtitle: 'Another POV at my projects',
                  connectType: 'Phone',
                  value: '+91 9818164010',
                ),
                ConnectTiles(
                  isProject: isProject,
                  isRecruiter: isRecruiter,
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
                  isRecruiter: isRecruiter,
                  child1: Text(
                    isRecruiter
                        ? 'Here is my resume '
                        : 'If you like to hire me',
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
                      isRecruiter
                          ? 'Here is my resume '
                          : 'If you like to hire me',
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
                  isRecruiter: isRecruiter,
                  child1: CustomElevatedButton(
                    label: isRecruiter ? 'Download' : 'Click here',
                    isYellow: false,
                    onTap: () {
                      isRecruiter ? null : context.goNamed(Routes.requiters);
                    },
                  ),
                  child2: CustomElevatedButton(
                    label: isRecruiter ? 'Download' : 'Click here',
                    isYellow: true,
                    onTap: () {
                      isRecruiter ? null : context.goNamed(Routes.requiters);
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

class MobileConnect extends StatelessWidget {
  const MobileConnect(
      {super.key,
      required this.size,
      this.isProject = false,
      this.isRecruiter = false});

  final Size size;
  final bool isProject;
  final bool isRecruiter;

  @override
  Widget build(BuildContext context) {
    return LandingWidget(
      // height: MediaQuery.of(context).size.height * 0.8,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 62,
            ),
            Text(
              'Connect',
              style: AppTextStyle.mobileAnnotation,
            ),
            const SizedBox(
              height: 18,
            ),
            const Column(
              children: [
                MobileConnectTiles(
                  title: 'LINKEDIN',
                ),
                MobileConnectTiles(
                  title: 'BEHANCE',
                ),
                MobileConnectTiles(
                  title: 'INSTAGRAM',
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'EMAIL',
              style: AppTextStyle.mobileAnnotation,
            ),
            const SizedBox(
              height: 3,
            ),
            Text('razamohdsajjad@gmail.com',
                style: GoogleFonts.archivo(
                  fontSize: 14,
                  // fontWeight: FontWeight.w600,
                  height: 1.0049999952,
                  color: Palette.notWhite,
                )),
            const SizedBox(
              height: 17,
            ),
            Text(
              'PHONE ',
              style: AppTextStyle.mobileAnnotation,
            ),
            const SizedBox(
              height: 3,
            ),
            Text('+91 9818164010',
                style: GoogleFonts.archivo(
                  fontSize: 14,
                  // fontWeight: FontWeight.w600,
                  height: 1.0049999952,
                  color: Palette.notWhite,
                )),
            const SizedBox(
              height: 62,
            ),
            Text(
              'FOR REQRUITERS',
              style: AppTextStyle.mobileAnnotation,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
                isRecruiter
                    ? 'Want a copy of my resume?'
                    : 'Want to know more?',
                style: AppTextStyle.mobileBody.copyWith(color: Palette.hWhite)),
            const SizedBox(
              height: 11,
            ),
            YellowOutlinedButton(
              onTap: () {
                context.goNamed(Routes.requiters);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (c) => RecruitersScreen()));
              },
              label: isRecruiter ? 'Download' : 'Click here',
            ),
            Expanded(
              child: Image.asset(
                'assets/png/skull.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
