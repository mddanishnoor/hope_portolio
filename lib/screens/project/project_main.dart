import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../core/constant/constants.dart';
import '../../core/constant/theme/pallete.dart';
import '../../core/constant/theme/styles.dart';
import '../../core/widgets/landing_widget.dart';
import '../../core/widgets/project_card.dart';
import '../../providers/project_provider.dart';
import '../landing_screen/connect/connect_widget.dart';

class ProjectMainCopy extends StatelessWidget {
  const ProjectMainCopy(
      {super.key, required this.size, required this.scrollController});

  final Size size;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        primary: true,
        child: Consumer<ProjectProvider>(
          builder: (context, provider, child) {
            return Column(children: [
              SajjadRazaWidget(size: size),
              ProjectList(size: size),
              Connect(
                size: size,
                isProject: true,
              )
            ]);
          },
        ));
  }
}

class SajjadRazaWidget extends StatelessWidget {
  const SajjadRazaWidget(
      {super.key, required this.size, this.isYellow = false});

  final bool isYellow;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return LandingWidget(
      child: Stack(
        children: [
          Positioned(
            left: size.height * 0.0241,
            top: size.height * 0.063,
            child: Text(
              'HOPE',
              textAlign: TextAlign.center,
              style: GoogleFonts.bebasNeue(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                height: 0.8599999547,
                color: isYellow ? Palette.bgBlack : Palette.white,
              ),
            ),
          ),
          Column(
            children: [
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: MouseRegion(
                  onEnter: (event) =>
                      context.read<ProjectProvider>().toggleMagnify(true),
                  onExit: (event) =>
                      context.read<ProjectProvider>().toggleMagnify(false),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('MOHAMMAD SAJJAD RAZA',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.anotation.copyWith(
                                color: isYellow ? Palette.bgBlack : null)),
                        const SizedBox(
                          height: 16,
                        ),
                        Text('MY',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.heading.copyWith(
                                color: isYellow ? Palette.bgBlack : null)),
                        Text('FAVORITE',
                            overflow: TextOverflow.fade,
                            style: AppTextStyle.heading.copyWith(
                                color: isYellow
                                    ? Palette.bgBlack
                                    : Palette.hYellow)),
                        Text('PROJECTS',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.heading.copyWith(
                                color: isYellow ? Palette.bgBlack : null)),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectList extends StatelessWidget {
  const ProjectList({super.key, required this.size, this.isYellow = false});
  final Size size;
  final bool isYellow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1046),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Branding',
            style: AppTextStyle.anotation
                .copyWith(color: isYellow ? Palette.bgBlack : null),
          ),
          Column(
            children: images
                .map((e) => ProjectsCard(
                    size: Size(size.width * 0.8, size.height * 0.8), url: e))
                .toList(),
          )
        ],
      ),
    );
  }
}
