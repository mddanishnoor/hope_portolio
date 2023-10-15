import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/providers/cursor_provider.dart';
import 'package:portfolio/screens/project/projects_screen.dart';
import 'package:provider/provider.dart';

import '../../core/constant/constants.dart';
import '../../core/constant/theme/pallete.dart';
import '../../core/constant/theme/styles.dart';
import '../../core/widgets/project_card.dart';
import '../landing_page_1.dart';

class FavouriteProjects extends StatelessWidget {
  const FavouriteProjects({
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
                  border: Border.all(width: 1, color: Pallete.borderGrey)),
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
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => ProjectScreen()));
                          },
                          child: Center(
                            child: Text(
                              'See all >>',
                              style: AppTextStyle.buttonTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: MouseRegion(
                      onEnter: (event) =>
                          context.read<CursorProvider>().toggleHide(true),
                      onExit: (event) =>
                          context.read<CursorProvider>().toggleHide(false),
                      child: Container(
                        height: size.height * 0.653,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Pallete.grey,
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

class YellowOutlinedButton extends StatelessWidget {
  const YellowOutlinedButton({
    super.key,
    this.onTap,
    required this.child,
  });
  final Function()? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: 90,
          height: 24,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xfffbb023)),
            borderRadius: BorderRadius.circular(6),
          ),
          child: child),
    );
  }
}
