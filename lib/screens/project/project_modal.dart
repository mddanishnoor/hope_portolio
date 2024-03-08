import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:portfolio/core/constant/theme/pallete.dart';
import 'package:portfolio/core/constant/theme/styles.dart';
import 'package:portfolio/providers/project_provider.dart';
import 'package:portfolio/screens/project/project_main.dart';
import 'package:provider/provider.dart';

class ProjectViewer extends StatelessWidget {
  const ProjectViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Consumer<ProjectProvider>(builder: (context, provider, _) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        if (provider.currentProjectIndex != 0) {
                          provider.updateProjectIndex(
                              provider.currentProjectIndex - 1, context);
                        }
                      },
                      child: const CircleAvatar(
                        backgroundColor: Palette.bgBlack,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Palette.notWhite,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'PREVIOUS\nPROJECT',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.archivo(
                          fontSize: 9, color: Palette.hWhite),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    cacheExtent: 20 * MediaQuery.of(context).size.height,
                    // shrinkWrap: true,
                    itemCount:
                        viewerList[provider.currentProjectIndex].length + 1,
                    itemBuilder: (context, index) =>
                        index == viewerList[provider.currentProjectIndex].length
                            ? const MoreProjectsContainer()
                            : Image.asset(
                                viewerList[provider.currentProjectIndex][index],
                                fit: BoxFit.fitWidth,
                              )),
              ),
              // Expanded(
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: [
              //         ...viewerList[provider.currentProjectIndex]
              //             .map(
              //               (e) => Image.asset(
              //                 e,
              //                 fit: BoxFit.fitWidth,
              //               ),
              //             )
              //             .toList(),
              //         const MoreProjectsContainer()
              //       ],
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => context.pop(),
                      child: const CircleAvatar(
                        backgroundColor: Palette.bgBlack,
                        child: Icon(
                          Icons.close,
                          color: Palette.notWhite,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            if (provider.currentProjectIndex !=
                                (viewerList.length - 1)) {
                              provider.updateProjectIndex(
                                  provider.currentProjectIndex + 1, context);
                            }
                          },
                          child: const CircleAvatar(
                            backgroundColor: Palette.bgBlack,
                            child: Center(
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Palette.notWhite,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Next\nProject',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.archivo(
                              fontSize: 9, color: Palette.hWhite),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class MoreProjectsContainer extends StatelessWidget {
  const MoreProjectsContainer({
    super.key,
  });

  static final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Palette.bgBlack,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(60, 30, 60, 50),
            child: Text(
              'MORE PROJECTS',
              style: AppTextStyle.listExtended.copyWith(color: Palette.hWhite),
            ),
          ),
          SizedBox(
            height: 212,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: ListView(
                    controller: _scrollController,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...webProjectList.first.projects.map((e) => e.index ==
                              context
                                  .read<ProjectProvider>()
                                  .currentProjectIndex
                          ? const SizedBox()
                          : MoreProjectTile(
                              project: e,
                            )),
                      ...webProjectList.last.projects.map((e) => e.index ==
                              context
                                  .read<ProjectProvider>()
                                  .currentProjectIndex
                          ? const SizedBox()
                          : MoreProjectTile(
                              project: e,
                            )),
                      ...webMiscProjects.projects.map((e) => e.index ==
                              context
                                  .read<ProjectProvider>()
                                  .currentProjectIndex
                          ? const SizedBox()
                          : MoreProjectTile(
                              project: e,
                            )),
                    ],
                  ),
                ),
                Positioned(
                  left: 55,
                  top: 100,
                  child: InkWell(
                    onTap: () {
                      if (_scrollController.offset ==
                          _scrollController.initialScrollOffset) {
                        return;
                      }
                      _scrollController.animateTo(
                          _scrollController.offset - 357,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.bounceInOut);
                    },
                    child: const CircleAvatar(
                      radius: 15,
                      backgroundColor: Palette.notWhite,
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Palette.bgBlack,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 45,
                  top: 100,
                  child: InkWell(
                    onTap: () {
                      if (_scrollController.offset ==
                          _scrollController.position.maxScrollExtent) {
                        return;
                      }
                      _scrollController.animateTo(
                          _scrollController.offset + 357,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.bounceInOut);
                    },
                    child: const CircleAvatar(
                      radius: 15,
                      backgroundColor: Palette.notWhite,
                      child: Center(
                        child: Icon(
                          size: 15,
                          Icons.arrow_forward_ios,
                          color: Palette.bgBlack,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 70,
          )
        ],
      ),
    );
  }
}

class MoreProjectTile extends StatelessWidget {
  const MoreProjectTile({
    super.key,
    required this.project,
  });
  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 11),
      child: InkWell(
        onTap: () => context
            .read<ProjectProvider>()
            .updateProjectIndex(project.index, context),
        child: Stack(
          children: [
            Image.asset(
              project.media,
              width: 357,
              height: 212,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 27),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                      Colors.black.withOpacity(0.56),
                      Colors.transparent
                    ])),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.subCategory ?? '',
                      style: GoogleFonts.archivo(
                          fontSize: 4, color: Palette.hWhite),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      project.title,
                      style:
                          AppTextStyle.listExtended.copyWith(fontSize: 21.78),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(project.subtext.split('-').join('\n • '),
                        style: GoogleFonts.archivo(
                            fontSize: 8.17, color: Palette.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<List<String>> viewerList = [
  digiTandoor,
  sarathi,
  msme,
  bus,
  bd,
  mDots,
  mWTd,
  mSins,
  mTown
];

final List<String> digiTandoor = [
  'assets/png/dg_1.gif',
  'assets/png/dg_2.png',
  'assets/png/dg_3.png',
  'assets/png/dg_4.png',
  'assets/png/dg_5.png',
  'assets/png/dg_6.png',
  'assets/png/dg_7.png',
  'assets/png/dg_8.png',
];
final List<String> bd = [
  'assets/png/bd_01.gif',
  'assets/png/bd_02.png',
  'assets/png/bd_03.gif',
  'assets/png/bd_04.png',
  'assets/png/bd_05.gif',
  'assets/png/bd_06.png',
];

final List<String> sarathi = [
  'assets/png/sarathi_1.png',
  'assets/png/sarathi_2.png',
  'assets/png/sarathi_3.png',
  'assets/png/sarathi_4.png',
  'assets/png/sarathi_5.png',
  'assets/png/sarathi_6.png',
  'assets/png/sarathi_7.png',
  'assets/png/sarathi_8.png',
  'assets/png/sarathi_9.png',
  'assets/png/sarathi_10.png',
];

final List<String> msme = [
  'assets/png/msme_01.png',
  'assets/png/msme_02.png',
  'assets/png/msme_03.png',
  'assets/png/msme_04.png',
  'assets/png/msme_05.png',
  'assets/png/msme_06.png',
  'assets/png/msme_07.png',
  'assets/png/msme_08.png',
  'assets/png/msme_09.png',
  'assets/png/msme_10.png',
  'assets/png/msme_11_a.png',
  'assets/png/msme_11_b.png',
  'assets/png/msme_11_c.png',
  'assets/png/msme_12_a.png',
  'assets/png/msme_12_b.png',
  'assets/png/msme_13.png',
  'assets/png/msme_14.png',
  'assets/png/msme_15.png',
  'assets/png/msme_16.png',
  'assets/png/msme_17.png',
  'assets/png/msme_18.png',
];

final List<String> bus = [
  'assets/png/bus_01.png',
  'assets/png/bus_02.png',
  'assets/png/bus_03.png',
  'assets/png/bus_04.png',
  'assets/png/bus_05.png',
  'assets/png/bus_06.png',
  'assets/png/bus_07.png',
  'assets/png/bus_08.png',
  'assets/png/bus_09.png',
  'assets/png/bus_10.png',
  'assets/png/bus_11.png',
  'assets/png/bus_12.png',
  'assets/png/bus_13.png',
  'assets/png/bus_14.png',
  'assets/png/bus_15.png',
  'assets/png/bus_16.png',
  'assets/png/bus_17.png',
  'assets/png/bus_18.png',
  'assets/png/bus_19.png',
  'assets/png/bus_20_a.png',
  'assets/png/bus_20_b.png',
  'assets/png/bus_20_c.png',
  'assets/png/bus_20_d.png',
  'assets/png/bus_20_e.png',
  'assets/png/bus_21.png',
];

final List<String> mDots = [
  'assets/png/m_dot_01.png',
];

final List<String> mWTd = [
  'assets/png/m_wtd_01.png',
  'assets/png/m_wtd_02.png',
  'assets/png/m_wtd_03.png',
  'assets/png/m_wtd_04.png',
  'assets/png/m_wtd_05.png',
  'assets/png/m_wtd_06.png',
  'assets/png/m_wtd_07.png',
  'assets/png/m_wtd_08.png',
  'assets/png/m_wtd_09.png',
  'assets/png/m_wtd_10.png',
  'assets/png/m_wtd_11.png',
  'assets/png/m_wtd_12.png',
];

final List<String> mSins = [
  'assets/png/m_sins_00.png',
  'assets/png/m_sins_01.png',
  'assets/png/m_sins_02.png',
  'assets/png/m_sins_03.png',
  'assets/png/m_sins_04.png',
  'assets/png/m_sins_05.png',
  'assets/png/m_sins_06.png',
  'assets/png/m_sins_07.png',
];

final List<String> mTown = [
  'assets/png/m_town_01.jpg',
  'assets/png/m_town_02.jpg',
  'assets/png/m_town_03.jpg',
  'assets/png/m_town_04.jpg',
  'assets/png/m_town_05.jpg',
  'assets/png/m_town_06.jpg',
  'assets/png/m_town_07.jpg',
  'assets/png/m_town_08.jpg',
];
