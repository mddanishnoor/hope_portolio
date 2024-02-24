import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg.dart';
import 'package:video_player/video_player.dart';

import '../../core/constant/constants.dart';
import '../../core/constant/theme/pallete.dart';
import '../../core/constant/theme/styles.dart';
import '../../core/widgets/landing_widget.dart';
import '../../core/widgets/project_card.dart';
import '../../providers/project_provider.dart';
import '../home/widgets/connect_widget.dart';
import '../home/yellow_copy.dart';

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
    return size.width > 600 ? webWidget(context) : mobileWidget(context);
  }

  LandingWidget mobileWidget(BuildContext context) {
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
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('MOHAMMAD SAJJAD RAZA',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.mobileAnnotation.copyWith(
                              color: isYellow ? Palette.bgBlack : null)),
                      const SizedBox(
                        height: 16,
                      ),
                      Text('MY',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.mobileHeading.copyWith(
                              color: isYellow ? Palette.bgBlack : null)),
                      Text('FAVORITE',
                          overflow: TextOverflow.fade,
                          style: AppTextStyle.mobileHeading.copyWith(
                              color: isYellow
                                  ? Palette.bgBlack
                                  : Palette.hYellow)),
                      Text('PROJECTS',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.mobileHeading.copyWith(
                              color: isYellow ? Palette.bgBlack : null)),
                    ],
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

  LandingWidget webWidget(BuildContext context) {
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
    return size.width > 600 ? webWidget() : mobileWidget(context);
  }

  Widget mobileWidget(context) {
    return Column(children: [
      ...projectList
          .map((e) => ProjectThumbnailWidget(project: e, isYellow: isYellow))
          .toList(),
      isYellow
          ? MobileConnectYellow(
              size: size,
              isProject: true,
            )
          : MobileConnect(
              size: size,
              isProject: true,
            ),
    ]);
  }

  Padding webWidget() {
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
          ),
          Connect(
            size: size,
            isProject: true,
          )
        ],
      ),
    );
  }
}

class ProjectThumbnailWidget extends StatelessWidget {
  const ProjectThumbnailWidget({
    super.key,
    required this.isYellow,
    required this.project,
  });

  final bool isYellow;
  final CategoryModel project;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.category,
            style: AppTextStyle.mobileAnnotation
                .copyWith(color: isYellow ? Palette.bgBlack : null),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: project.projects
                .map((e) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.59,
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
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 17.5),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                      Colors.black.withOpacity(0.56),
                                      Colors.transparent
                                    ])),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.title,
                                      style: AppTextStyle.mobileExtended,
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      e.subtext,
                                      style: GoogleFonts.archivo(
                                          fontSize: 10, color: Palette.hWhite),
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
          ),
          const SizedBox(
            height: 36,
          ),
        ],
      ),
    );
  }
}

class ThumbnailAssetWidget extends StatefulWidget {
  const ThumbnailAssetWidget({
    super.key,
    required this.media,
  });

  final String media;

  @override
  State<ThumbnailAssetWidget> createState() => _ThumbnailAssetWidgetState();
}

class _ThumbnailAssetWidgetState extends State<ThumbnailAssetWidget> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    if (widget.media.contains('.mp4')) {
      _videoController = VideoPlayerController.asset(widget.media,
          videoPlayerOptions: VideoPlayerOptions());

      _videoController.initialize().then((value) => setState(() {}));
      _videoController
        ..play()
        ..setLooping(true);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.59,
        width: double.infinity,
        child: widget.media.contains('.mp4')
            ? FittedBox(
                fit: BoxFit.cover,
                clipBehavior: Clip.hardEdge,
                child: SizedBox(
                  width: _videoController.value.size.width,
                  height: _videoController.value.size.height,
                  child: VideoPlayer(_videoController),
                ),
              )
            // ? FittedBox(
            //     fit: BoxFit.cover,
            //     child: AspectRatio(
            //         aspectRatio: 271 / 383, child: VideoPlayer(_videoController)),
            //   )
            : Image.asset(
                widget.media,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
      ),
    );
  }

  @override
  void dispose() {
    if (widget.media.contains('.mp4')) {
      _videoController.dispose();
    }
    super.dispose();
  }
}

List<CategoryModel> projectList = [
  CategoryModel(category: 'UI/UX', projects: [
    ProjectModel(
        media: 'assets/video/digitandoor.mp4',
        title: 'Digitandoor',
        subtext: 'Building an online presence for an advertisement firm.'),
    ProjectModel(
        media: 'assets/png/mobile_sarathi.png',
        title: 'Sarathi\nParivahan',
        subtext:
            'Reimagining the experience of application process for drivers license'),
    ProjectModel(
        media: 'assets/png/mobile_msme.png',
        title: 'M.S.M.E',
        subtext: 'Payment and collection dashboard for accountants'),
    ProjectModel(
        media: 'assets/png/mobile_bus_easy.png',
        title: 'Bus Easy',
        subtext: 'User centric approach to bus navigation'),
  ]),
  CategoryModel(category: 'BRANDING', projects: [
    ProjectModel(
        media: 'assets/video/digitandoor.mp4',
        title: 'Digitandoor',
        subtext: 'Building an online presence for an advertisement firm.'),
  ])
];

class CategoryModel {
  String category;
  List<ProjectModel> projects;
  CategoryModel({
    required this.category,
    required this.projects,
  });
}

class ProjectModel {
  String media;
  String title;
  String subtext;
  ProjectModel({
    required this.media,
    required this.title,
    required this.subtext,
  });
}
