import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/providers/cursor_provider.dart';
import 'package:portfolio/providers/reqruiters_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constant/theme/pallete.dart';
import '../../../core/constant/theme/styles.dart';
import '../../../core/helper/download_service.dart';
import '../../../core/router/routes.dart';
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
    return Column(
      children: [
        LandingWidget(
          child: Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.105, right: size.width * 0.08),
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
                    GestureDetector(
                      onTap: () => launchUrl(Uri.parse(
                          'https://www.linkedin.com/in/mohammad-sajjad-raza-82b906180/')),
                      child: ConnectTiles(
                        isProject: isProject,
                        isRecruiter: isRecruiter,
                        title: 'LinkedIn',
                        subtitle: 'Work, work, work',
                        connectType: 'EMAIL',
                        value: 'razamohdsajjad@gmail.com',
                      ),
                    ),
                    GestureDetector(
                      onTap: () => launchUrl(
                          Uri.parse('https://www.behance.net/sajjadraza')),
                      child: ConnectTiles(
                        isProject: isProject,
                        isRecruiter: isRecruiter,
                        title: 'Behance',
                        subtitle: 'Another POV at my projects',
                        connectType: 'Phone',
                        value: '+91 9818164010',
                      ),
                    ),
                    GestureDetector(
                      onTap: () => launchUrl(Uri.parse(
                          'https://www.instagram.com/_akahope?igsh=dWlrZGs1cWI3c2oz')),
                      child: ConnectTiles(
                        isProject: isProject,
                        isRecruiter: isRecruiter,
                        title: 'Instagram',
                        subtitle: 'My inactive social face',
                        connectType: 'Phone',
                        value: '+91 9818164010',
                        hasConnectValue: false,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
                // SizedBox(
                //   height: size.height * 0.2,
                // ),
              ],
            ),
          ),
        ),
        LandingWidget(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/png/web_footer.png'))),
          child: MouseRegion(
              onEnter: (event) => isRecruiter
                  ? context.read<RecruitersProvider>().toggleHide(true)
                  : context.read<CursorProvider>().toggleHide(true),
              onExit: (event) => isRecruiter
                  ? context.read<RecruitersProvider>().toggleHide(false)
                  : context.read<CursorProvider>().toggleHide(false),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  RecruiterCard(
                    isRecruiter: isRecruiter,
                    size: size,
                  ),
                  const Spacer()
                ],
              )),
        )
      ],
    );
  }
}

class RecruiterCard extends StatefulWidget {
  const RecruiterCard({
    super.key,
    required this.isRecruiter,
    required this.size,
  });

  final bool isRecruiter;
  final Size size;

  @override
  State<RecruiterCard> createState() => _RecruiterCardState();
}

class _RecruiterCardState extends State<RecruiterCard> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => setState(() {
        isHovered = true;
      }),
      onExit: (event) => setState(() {
        isHovered = false;
      }),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: widget.size.width * 0.105,
                right: widget.size.width * 0.08),
            child: Text(
              'FOR RECRUITERS',
              style: AppTextStyle.annotation.copyWith(color: Palette.hWhite),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                    left: widget.size.width * 0.105,
                    right: widget.size.width * 0.08),
                child: Row(
                  children: [
                    Text(
                      widget.isRecruiter
                          ? 'Here is my resume '
                          : 'Want to know more?',
                      style: AppTextStyle.body.copyWith(
                          color: isHovered ? Palette.bgBlack : Palette.hWhite),
                    ),
                    const Spacer(),
                    CustomElevatedButton(
                      label:
                          widget.isRecruiter ? 'Download Resume' : 'Let\'s Go',
                      margin: EdgeInsets.zero,
                      isYellow: isHovered,
                      onTap: () {
                        if (widget.isRecruiter) {
                          downloadFileFromAssets('assets/pdf/resume.pdf',
                              'Resume_Mohammad_Sajjad_Raza.pdf');
                          return;
                        }
                        context.goNamed(Routes.requiters);
                      },
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  padding: EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                      left: widget.size.width * 0.105,
                      right: widget.size.width * 0.08),
                  duration: const Duration(milliseconds: 150),
                  color: Palette.hYellow,
                  height: isHovered ? null : 0,
                  child: Row(
                    children: [
                      Expanded(
                        // flex: 3,
                        child: Row(
                          children: [
                            Text(
                              widget.isRecruiter
                                  ? 'Here is my resume '
                                  : 'exp. education and rest',
                              style: AppTextStyle.body.copyWith(
                                  color: isHovered
                                      ? Palette.bgBlack
                                      : Palette.hWhite),
                            ),
                            isHovered && widget.isRecruiter
                                ? const Text('For documentation purposes')
                                : const Spacer(),
                          ],
                        ),
                      ),
                      CustomElevatedButton(
                        label: widget.isRecruiter
                            ? 'Download Resume'
                            : 'Let\'s Go',
                        margin: EdgeInsets.zero,
                        isYellow: isHovered,
                        onTap: () {
                          if (widget.isRecruiter) {
                            downloadFileFromAssets('assets/pdf/resume.pdf',
                                'Resume_Mohammad_Sajjad_Raza.pdf');
                            return;
                          }
                          context.goNamed(Routes.requiters);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
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
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Column(
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
                    'FOR RECRUITERS',
                    style: AppTextStyle.mobileAnnotation,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                      isRecruiter
                          ? 'Want a copy of my resume?'
                          : 'Want to know more?',
                      style: AppTextStyle.mobileBody
                          .copyWith(color: Palette.hWhite)),
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
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Image.asset(
          'assets/png/mobile_footer.png',
          width: double.infinity,
          fit: BoxFit.contain,
        )
      ],
    );
  }
}
