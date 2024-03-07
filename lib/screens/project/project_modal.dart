import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:portfolio/core/constant/theme/pallete.dart';
import 'package:portfolio/providers/project_provider.dart';
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
                              provider.currentProjectIndex - 1);
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
                  shrinkWrap: true,
                  itemCount: viewerList[provider.currentProjectIndex].length,
                  itemBuilder: (c, i) => Image.asset(
                    viewerList[provider.currentProjectIndex][i],
                  ),
                ),
              ),
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
                                viewerList.length) {
                              provider.updateProjectIndex(
                                  provider.currentProjectIndex + 1);
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

final List<List<String>> viewerList = [digiTandoor, sarathi, msme, bus];

final List<String> digiTandoor = [
  'assets/png/web_Digi_branding.gif',
  'assets/png/dg_2.png',
  'assets/png/dg_3.png',
  'assets/png/dg_3.png',
  'assets/png/dg_4.png',
  'assets/png/dg_5.png',
  'assets/png/dg_6.png',
  'assets/png/dg_7.png',
  'assets/png/dg_8.png',
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
  'assets/png/msme_11.png',
  'assets/png/msme_12.png',
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
  'assets/png/bus_20.png',
  'assets/png/bus_21.png',
];
