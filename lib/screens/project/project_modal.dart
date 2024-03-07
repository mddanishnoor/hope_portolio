import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:portfolio/core/constant/theme/pallete.dart';

class ProjectViewer extends StatelessWidget {
  const ProjectViewer({super.key, required this.data});
  final List<String> data;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: Palette.bgBlack,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Palette.notWhite,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'PREVIOUS\nPROJECT',
                    textAlign: TextAlign.center,
                    style:
                        GoogleFonts.archivo(fontSize: 9, color: Palette.hWhite),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (c, i) => Image.asset(
                  data[i],
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
                      const CircleAvatar(
                        backgroundColor: Palette.bgBlack,
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Palette.notWhite,
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
        ),
      ),
    );
  }
}

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
