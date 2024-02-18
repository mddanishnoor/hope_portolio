import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/providers/reqruiters_provider.dart';
import 'package:portfolio/providers/cursor_provider.dart';
import 'package:portfolio/screens/project/projects_screen.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/constants.dart';
import '../../../core/constant/theme/pallete.dart';
import '../../../core/constant/theme/styles.dart';
import '../../../core/widgets/landing_widget.dart';
import '../../../core/widgets/project_card.dart';

class FavoriteProjects extends StatelessWidget {
  const FavoriteProjects(
      {super.key, required this.size, this.isRecruiter = false});

  final Size size;
  final bool isRecruiter;

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
              'PROJECTS ',
              style: AppTextStyle.anotation,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: size.height * 0.84,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Palette.borderGrey)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.065,
                      vertical: size.height * 0.0299,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('My favorite \nprojects',
                            style: AppTextStyle.listExtended),
                        const Spacer(),
                        YellowOutlinedButton(
                          isRecruiter: isRecruiter,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => ProjectScreen()));
                          },
                          label: 'See all >>',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: MouseRegion(
                      onEnter: (event) => isRecruiter
                          ? context.read<RecruitersProvider>().toggleHide(true)
                          : context.read<CursorProvider>().toggleHide(true),
                      onExit: (event) => isRecruiter
                          ? context.read<RecruitersProvider>().toggleHide(false)
                          : context.read<CursorProvider>().toggleHide(false),
                      child: Container(
                        height: size.height * 0.653,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Palette.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: CarouselSlider(
                          items: images
                              .map((e) => ProjectsCard(
                                  size:
                                      Size(size.width * 0.4, size.height * 0.4),
                                  url: e))
                              .toList(),
                          options: CarouselOptions(
                            aspectRatio: 700 / 420,
                            viewportFraction: 0.65,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 2),
                            autoPlayAnimationDuration:
                                const Duration(seconds: 1),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.35,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MobileFavoriteProjects extends StatelessWidget {
  const MobileFavoriteProjects(
      {super.key, required this.size, this.isRecruiter = false});

  final Size size;
  final bool isRecruiter;

  @override
  Widget build(BuildContext context) {
    return LandingWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PROJECTS ',
              style: AppTextStyle.mobileAnnotation,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              // height: size.height * 0.84,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Palette.borderGrey)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.065,
                      vertical: size.height * 0.0299,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MY FAVORITE \nPROJECTS',
                          style: GoogleFonts.archivo(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            height: 0.86,
                            letterSpacing: -1.42,
                            color: Palette.hWhite,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            YellowOutlinedButton(
                              isRecruiter: isRecruiter,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (c) => ProjectScreen()));
                              },
                              label: 'See all >>',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Palette.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        CarouselSlider(
                          items: images
                              .map((e) => ProjectsCard(
                                  size: Size(size.width, size.height), url: e))
                              .toList(),
                          options: CarouselOptions(
                            aspectRatio: 4 / 5,
                            // viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 2),
                            autoPlayAnimationDuration:
                                const Duration(seconds: 1),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.4,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class YellowOutlinedButton extends StatefulWidget {
  const YellowOutlinedButton(
      {super.key,
      this.onTap,
      required this.label,
      this.labelStyle,
      this.isRecruiter = false});
  final Function()? onTap;
  final String label;
  final TextStyle? labelStyle;
  final bool isRecruiter;

  @override
  State<YellowOutlinedButton> createState() => _YellowOutlinedButtonState();
}

class _YellowOutlinedButtonState extends State<YellowOutlinedButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
          widget.isRecruiter
              ? context.read<RecruitersProvider>().toggleHide(true)
              : context.read<CursorProvider>().toggleHide(true);
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
          widget.isRecruiter
              ? context.read<RecruitersProvider>().toggleHide(false)
              : context.read<CursorProvider>().toggleHide(false);
        });
      },
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1.0,
                  color: !isHovered ? Palette.hYellow : Palette.bgBlack),
              borderRadius: BorderRadius.circular(6),
              color: isHovered ? Palette.hYellow : Palette.bgBlack
              // You can set the background color here.
              // Example: color: buttonColor,
              ),
          child: Center(
              child: Text(
            widget.label,
            style: widget.labelStyle ??
                AppTextStyle.buttonTextStyle.copyWith(
                    color: isHovered ? Palette.bgBlack : Palette.hYellow),
          )),
        ),
      ),
    );
  }
}
