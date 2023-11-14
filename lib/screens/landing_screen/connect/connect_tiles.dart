import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../core/constant/theme/pallete.dart';
import '../../../core/constant/theme/styles.dart';
import '../../../core/widgets/animated_tile.dart';

class ConnectTiles extends StatelessWidget {
  const ConnectTiles(
      {super.key,
      required this.title,
      required this.connectType,
      required this.value,
      required this.subtitle,
      this.isProject = false,
      this.hasConnectValue = true});

  final String title;
  final String subtitle;
  final String connectType;
  final String value;
  final bool hasConnectValue;
  final bool isProject;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12, right: 16),
                child: SvgPicture.asset('svg/rectangle.svg'),
              ),
              Expanded(
                child: AnimatedTileContainer(
                  isProject: isProject,
                  child1: ColoredBox(
                    color: Palette.bgBlack,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 10,
                          child: Text(
                            title,
                            style: AppTextStyle.body,
                          ),
                        ),
                        Expanded(
                          flex: 9,
                          child: Container(
                            padding:
                                const EdgeInsets.only(bottom: 16, left: 32),
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              subtitle,
                              style: GoogleFonts.archivo(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Palette.bgBlack),
                            ),
                          ),
                        ),
                        // const Spacer()
                      ],
                    ),
                  ),
                  child2: ColoredBox(
                    color: Palette.hYellow,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 10,
                          child: Text(
                            title,
                            style: AppTextStyle.body
                                .copyWith(color: Palette.bgBlack),
                          ),
                        ),
                        Expanded(
                          flex: 9,
                          child: Container(
                            padding:
                                const EdgeInsets.only(bottom: 16, left: 32),
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              subtitle,
                              style: GoogleFonts.archivo(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Palette.bgBlack),
                            ),
                          ),
                        ),
                        // const Spacer()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: hasConnectValue
              ? AnimatedTileContainer(
                  isProject: isProject,
                  child1: Container(
                    padding: const EdgeInsets.all(4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(connectType,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.anotationBold),
                        const SizedBox(
                          height: 8.9,
                        ),
                        Text(value, style: AppTextStyle.anotationBody),
                      ],
                    ),
                  ),
                  child2: Container(
                    padding: const EdgeInsets.all(4),
                    color: Palette.hYellow,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(connectType,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.anotationBold
                                .copyWith(color: Palette.bgBlack)),
                        const SizedBox(
                          height: 8.9,
                        ),
                        Text(value,
                            style: AppTextStyle.anotationBody
                                .copyWith(color: Palette.bgBlack)),
                      ],
                    ),
                  ),
                )
              : const SizedBox(),
        )
      ],
    );
  }
}
