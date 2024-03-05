import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/providers/reqruiters_provider.dart';
import 'package:portfolio/providers/cursor_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/theme/pallete.dart';
import '../../../core/constant/theme/styles.dart';
import '../../../core/router/routes.dart';
import '../../../core/widgets/landing_widget.dart';
import '../../project/project_main.dart';

class FavoriteProjects extends StatelessWidget {
  const FavoriteProjects(
      {super.key, required this.size, this.isRecruiter = false});

  final Size size;
  final bool isRecruiter;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => isRecruiter
          ? context.read<RecruitersProvider>().toggleHide(true)
          : context.read<CursorProvider>().toggleHide(true),
      onExit: (event) => isRecruiter
          ? context.read<RecruitersProvider>().toggleHide(false)
          : context.read<CursorProvider>().toggleHide(false),
      child: LandingWidget(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.105),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PROJECTS ',
                style: AppTextStyle.annotation,
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
                    TitleWidget(size: size, isRecruiter: isRecruiter),
                    Expanded(
                      child: Container(
                        height: size.height * 0.653,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Palette.grey,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        child: const ProjectCarouselWidget(),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectCarouselWidget extends StatefulWidget {
  const ProjectCarouselWidget({
    super.key,
  });

  @override
  State<ProjectCarouselWidget> createState() => _ProjectCarouselWidgetState();
}

class _ProjectCarouselWidgetState extends State<ProjectCarouselWidget> {
  bool autoPlay = true;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() {
        autoPlay = false;
      }),
      onExit: (event) => setState(() {
        autoPlay = true;
      }),
      child: CarouselSlider(
        items: webProjectList.first.projects
            .map((e) => ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.only(top: 12),
                    child: Stack(
                      children: [
                        WebThumbnailAssetWidget(
                          media: e.media,
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.85,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.85,
                              width:
                                  (MediaQuery.of(context).size.width * 0.85) *
                                      0.5,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 81),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                    Colors.black.withOpacity(0.56),
                                    Colors.transparent
                                  ])),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.subCategory ?? '',
                                    style: GoogleFonts.archivo(
                                        fontSize: 12, color: Palette.hWhite),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    e.title,
                                    style: AppTextStyle.listExtended,
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Text(e.subtext.split('-').join('\n • '),
                                      style: GoogleFonts.archivo(
                                          fontSize: 24, color: Palette.white)),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  InkWell(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border:
                                            Border.all(color: Palette.hWhite),
                                      ),
                                      child: Text(
                                        'View case study >>',
                                        style: AppTextStyle.buttonTextStyle
                                            .copyWith(color: Palette.hWhite),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ))
            .toList(),

        // images
        //     .map((e) =>

        //     ProjectsCard(
        //         size:
        //             Size(size.width * 0.4, size.height * 0.4),
        //         url: e))
        //     .toList(),
        options: CarouselOptions(
          aspectRatio: 700 / 420,
          viewportFraction: 0.65,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: autoPlay,
          autoPlayInterval: const Duration(seconds: 2),
          autoPlayAnimationDuration: const Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.35,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}

class TitleWidget extends StatefulWidget {
  const TitleWidget({
    super.key,
    required this.size,
    required this.isRecruiter,
  });

  final Size size;
  final bool isRecruiter;

  @override
  State<TitleWidget> createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            color: isHovered ? Palette.hYellow : null),
        padding: EdgeInsets.symmetric(
          horizontal: widget.size.width * 0.065,
          vertical: widget.size.height * 0.0299,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                  isHovered ? 'Portfolio Case Studies' : 'My favorite projects',
                  style: AppTextStyle.listExtended
                      .copyWith(color: isHovered ? Palette.bgBlack : null)),
            ),
            // const Spacer(),
            isHovered
                ? InkWell(
                    onTap: () {
                      context.goNamed(Routes.projects);
                    },
                    child: Container(
                      width: 90,
                      height: 24,
                      decoration: BoxDecoration(
                        border: Border.all(color: Palette.bgBlack),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          'See all >>',
                          style: AppTextStyle.buttonTextStyle
                              .copyWith(color: Palette.bgBlack),
                        ),
                      ),
                    ),
                  )
                : YellowOutlinedButton(
                    isRecruiter: widget.isRecruiter,
                    onTap: () {
                      context.goNamed(Routes.projects);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (c) => ProjectScreen()));
                    },
                    label: 'See all >>',
                  ),
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
                                context.goNamed(Routes.projects);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (c) => ProjectScreen()));
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
                          items: projectList.first.projects
                              .map((e) => ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.59,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      margin: const EdgeInsets.only(top: 12),
                                      child: Stack(
                                        children: [
                                          ThumbnailAssetWidget(
                                            media: e.media,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              // height: MediaQuery.of(context)
                                              //         .size
                                              //         .height *
                                              //     0.15,
                                              width: double.infinity,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20,
                                                      horizontal: 17.5),
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      begin: Alignment
                                                          .bottomCenter,
                                                      end: Alignment.topCenter,
                                                      colors: [
                                                    Colors.black
                                                        .withOpacity(0.56),
                                                    Colors.transparent
                                                  ])),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    e.title,
                                                    style: AppTextStyle
                                                        .mobileExtended,
                                                  ),
                                                  const SizedBox(
                                                    height: 6,
                                                  ),
                                                  Text(
                                                    e.subtext,
                                                    style: GoogleFonts.archivo(
                                                        fontSize: 12,
                                                        color: Palette.hWhite),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
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
