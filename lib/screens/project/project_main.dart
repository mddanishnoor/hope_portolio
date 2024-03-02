import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/helper/custom_scroll_physics.dart';
import 'package:provider/provider.dart';
// import 'package:video_player/video_player.dart';
import '../../core/constant/theme/pallete.dart';
import '../../core/constant/theme/styles.dart';
import '../../core/router/routes.dart';
import '../../core/widgets/landing_widget.dart';
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
        physics: const CustomPhysics(),
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
            top: size.height * 0.04,
            child: Hero(
              tag: 'hope',
              child: GestureDetector(
                onTap: () => context.goNamed(Routes.homeScreen),
                child: Text(
                  'HOPE',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.bebasNeue(
                    fontSize: 21.961,
                    fontWeight: FontWeight.w400,
                    height: 0.8599999547,
                    color: isYellow ? Palette.bgBlack : Palette.white,
                  ),
                ),
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
      decoration: isYellow
          ? null
          : const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/png/project_landing.png',
                  ),
                  fit: BoxFit.cover)),
      child: Stack(
        children: [
          Positioned(
            left: size.height * 0.0241,
            top: size.height * 0.063,
            child: GestureDetector(
              onTap: () => context.goNamed(Routes.homeScreen),
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
                            style: AppTextStyle.annotation.copyWith(
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
    return size.width > 600 ? webWidget(context) : mobileWidget(context);
  }

  Widget mobileWidget(context) {
    return Column(children: [
      ...projectList
          .map((e) => ProjectThumbnailWidget(project: e, isYellow: isYellow))
          .toList(),
      SizedBox(
        height: size.height * 0.5,
        child: MiscThumbnailWidget(
          isYellow: isYellow,
        ),
      ),
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

  Widget webWidget(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => context.read<ProjectProvider>().toggleHide(true),
      onExit: (event) => context.read<ProjectProvider>().toggleHide(false),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 33,
          ),
          ...webProjectList
              .map((e) =>
                  WebProjectThumbnailWidget(project: e, isYellow: isYellow))
              .toList(),
          SizedBox(
            height: size.height * 0.70,
            child: WebMiscThumbnailWidget(
              isYellow: isYellow,
            ),
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

class WebProjectThumbnailWidget extends StatelessWidget {
  const WebProjectThumbnailWidget({
    super.key,
    required this.isYellow,
    required this.project,
  });

  final bool isYellow;
  final CategoryModel project;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.9,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1046),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.category,
            style: AppTextStyle.annotation
                .copyWith(color: isYellow ? Palette.bgBlack : null),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: project.projects
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
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.85,
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
                                            fontSize: 24,
                                            color: Palette.white)),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    InkWell(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
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
                                          fontSize: 12, color: Palette.hWhite),
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

class MiscThumbnailWidget extends StatelessWidget {
  const MiscThumbnailWidget({
    super.key,
    required this.isYellow,
  });

  final bool isYellow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              miscProjects.category,
              style: AppTextStyle.mobileAnnotation
                  .copyWith(color: isYellow ? Palette.bgBlack : null),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              separatorBuilder: (context, index) => const SizedBox(
                width: 16,
              ),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: miscProjects.projects.length,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  // height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.only(top: 12),
                  child: Stack(
                    children: [
                      ThumbnailAssetWidget(
                        media: miscProjects.projects[index].media,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 2,
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
                              if (miscProjects.projects[index].subCategory !=
                                  null) ...[
                                Text(
                                  miscProjects.projects[index].subCategory!,
                                  style: GoogleFonts.archivo(
                                      fontSize: 12, color: Palette.hWhite),
                                ),
                                const SizedBox(
                                  height: 6,
                                )
                              ],
                              Text(
                                miscProjects.projects[index].title,
                                style: AppTextStyle.mobileExtended,
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                miscProjects.projects[index].subtext,
                                style: GoogleFonts.archivo(
                                    fontSize: 12, color: Palette.hWhite),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 36,
          ),
        ],
      ),
    );
  }
}

class WebMiscThumbnailWidget extends StatelessWidget {
  const WebMiscThumbnailWidget({
    super.key,
    required this.isYellow,
  });

  final bool isYellow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height * 0.70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1046),
            child: Text(
              webMiscProjects.category,
              style: AppTextStyle.annotation
                  .copyWith(color: isYellow ? Palette.bgBlack : null),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1046),
              separatorBuilder: (context, index) => const SizedBox(
                width: 16,
              ),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: webMiscProjects.projects.length,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: MediaQuery.of(context).size.height * 0.70,
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.only(top: 12),
                  child: Stack(
                    children: [
                      WebThumbnailAssetWidget(
                        media: webMiscProjects.projects[index].media,
                        width: MediaQuery.of(context).size.width * 0.65,
                        height: MediaQuery.of(context).size.height * 0.70,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.70,
                          width:
                              (MediaQuery.of(context).size.width * 0.65) * 0.5,
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
                                miscProjects.projects[index].subCategory ?? '',
                                style: GoogleFonts.archivo(
                                    fontSize: 12, color: Palette.hWhite),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                miscProjects.projects[index].title,
                                style: AppTextStyle.listExtended
                                    .copyWith(fontSize: 47.94),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                  miscProjects.projects[index].subtext
                                      .split('-')
                                      .join('\n • '),
                                  style: GoogleFonts.archivo(
                                      fontSize: 17.99, color: Palette.white)),
                              const SizedBox(
                                height: 16,
                              ),
                              InkWell(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(color: Palette.hWhite),
                                  ),
                                  child: Text(
                                    'View case study >>',
                                    style: AppTextStyle.buttonTextStyle
                                        .copyWith(
                                            color: Palette.hWhite,
                                            fontSize: 12),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 36,
          ),
        ],
      ),
    );
  }
}

class WebThumbnailAssetWidget extends StatefulWidget {
  const WebThumbnailAssetWidget({
    super.key,
    required this.media,
    this.width,
    this.height,
  });

  final String media;
  final double? width, height;

  @override
  State<WebThumbnailAssetWidget> createState() =>
      _WebThumbnailAssetWidgetState();
}

class _WebThumbnailAssetWidgetState extends State<WebThumbnailAssetWidget> {
  // late VideoPlayerController _videoController;

  @override
  void initState() {
    // if (widget.media.contains('.mp4')) {
    //   _videoController = VideoPlayerController.asset(widget.media,
    //       videoPlayerOptions: VideoPlayerOptions());

    //   _videoController.initialize().then((value) => setState(() {}));
    //   _videoController
    //     ..play()
    //     ..setLooping(true);
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox.expand(
        // width: widget.width ?? double.infinity,
        // height: widget.height ?? double.infinity,
        child: widget.media.contains('.mp4')
            // ? FittedBox(
            //     fit: BoxFit.cover,
            //     clipBehavior: Clip.hardEdge,
            //     child: SizedBox(
            //       width:
            //           widget.width ?? MediaQuery.of(context).size.width * 0.85,
            //       height: widget.height ??
            //           MediaQuery.of(context).size.height * 0.85,
            //       child: VideoPlayer(_videoController),
            //     ),
            //   )
            ? Image.asset(
                'assets/png/test.gif',
                width: widget.width ?? double.infinity,
                height: widget.height,
                fit: BoxFit.cover,
              )
            : Image.asset(
                widget.media,
                width: widget.width ?? double.infinity,
                height: widget.height,
                fit: BoxFit.cover,
              ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   if (widget.media.contains('.mp4')) {
  //     _videoController.dispose();
  //   }
  //   super.dispose();
  // }
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
  // late VideoPlayerController _videoController;

  // @override
  // void initState() {
  //   if (widget.media.contains('.mp4')) {
  //     _videoController = VideoPlayerController.asset(widget.media,
  //         videoPlayerOptions: VideoPlayerOptions());

  //     _videoController.initialize().then((value) => setState(() {}));
  //     _videoController
  //       ..play()
  //       ..setLooping(true);
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.59,
        width: double.infinity,
        child: widget.media.contains('.mp4')
            // ? FittedBox(
            //     fit: BoxFit.cover,
            //     clipBehavior: Clip.hardEdge,
            //     child: SizedBox(
            //       width: _videoController.value.size.width,
            //       height: _videoController.value.size.height,
            //       child: VideoPlayer(_videoController),
            //     ),
            //   )
            ? Image.asset(
                'assets/png/test.gif',
                width: double.infinity,
                fit: BoxFit.cover,
              )
            : Image.asset(
                widget.media,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   if (widget.media.contains('.mp4')) {
  //     _videoController.dispose();
  //   }
  //   super.dispose();
  // }
}

List<CategoryModel> webProjectList = [
  CategoryModel(category: 'UI/UX', projects: [
    ProjectModel(
        media: 'assets/png/web_DIgi_website.gif',
        title: 'Digitandoor',
        subCategory: 'Building An Online Presence For\nAn Advertisement Firm.',
        subtext: '-Landing Page-Responsive-Copywriting-Illustration'),
    ProjectModel(
        media: 'assets/png/web_sarathi_parivahan.png',
        title: 'Sarathi\nParivahan',
        subtext: '-Website-Information Architecture-UX/UI-Research',
        subCategory:
            'Reimagining The Experience Of\nApplication Process For Drivers License'),
    ProjectModel(
        media: 'assets/png/web_thumbnail_msme.png',
        title: 'M.S.M.E',
        subtext: '-UX Research-Prototyping-Style guide-Design Facilitation',
        subCategory: 'Payment And Collection\nDashboard For Accountants'),
    ProjectModel(
        media: 'assets/png/web_thumbnail_bus_easy.png',
        title: 'Bus Easy',
        subtext: '-App Design-User Research-Prototyping-User testing',
        subCategory: 'User Centric Approach To\nBus Navigate'),
  ]),
  CategoryModel(category: 'BRANDING', projects: [
    ProjectModel(
        media: 'assets/png/web_Digi_branding.gif',
        title: 'Digitandoor',
        subtext: 'Landing Page-Logo-Brand Merchandise-Illustrations',
        subCategory: 'Curating Brand Identity\nAnd Landing Page'),
  ])
];

CategoryModel webMiscProjects =
    CategoryModel(category: 'MISCELLANEOUS', projects: [
  ProjectModel(
      media: 'assets/png/web_thumbnail_Dots.png',
      subCategory: 'Game Design',
      title: 'Dots',
      subtext: 'Reimagining childhood game in the digital age'),
  ProjectModel(
      media: 'assets/png/web_thumbnail_Ways_of_death.png',
      subCategory: 'Graphic Design',
      title: 'Ways of Death',
      subtext: 'Symbolic portrayal of kinds of human demise.'),
  ProjectModel(
      media: 'assets/png/web_thumbnail_7_Deadly_Sins.png',
      subCategory: 'Graphic Design',
      title: '7 Deadly Sins',
      subtext: 'Graphical portrayal of seven deadly sins'),
  ProjectModel(
      media: 'assets/png/web_thumbnail_Paper_town.png',
      subCategory: 'Graphic Design',
      title: 'Paper Town',
      subtext: 'Embark on a journey through pages'),
]);

List<CategoryModel> projectList = [
  CategoryModel(category: 'UI/UX', projects: [
    ProjectModel(
        media: 'assets/png/mobile_DIgi_website.gif',
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
        media: 'assets/png/mobile_Digi_branding.gif',
        title: 'Digitandoor',
        subtext: 'Building an online presence for an advertisement firm.'),
  ])
];

CategoryModel miscProjects = CategoryModel(category: 'MISC', projects: [
  ProjectModel(
      media: 'assets/png/dot_mobile.png',
      subCategory: 'Game Design',
      title: 'Dots',
      subtext: 'Reimagining childhood game in the digital age'),
  ProjectModel(
      media: 'assets/png/mobile_ways_of_death.png',
      subCategory: 'Graphic Design',
      title: 'Ways of Death',
      subtext: 'Symbolic portrayal of kinds of human demise.'),
  ProjectModel(
      media: 'assets/png/mobile_sins.png',
      subCategory: 'Graphic Design',
      title: '7 Deadly Sins',
      subtext: 'Graphical portrayal of seven deadly sins'),
  ProjectModel(
      media: 'assets/png/paper_town_mobile.png',
      subCategory: 'Graphic Design',
      title: 'Paper Town',
      subtext: 'Embark on a journey through pages'),
]);

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
  String? subCategory;
  ProjectModel({
    this.subCategory,
    required this.media,
    required this.title,
    required this.subtext,
  });
}
