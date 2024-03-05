import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      this.hasConnectValue = true,
      this.isRecruiter = false});

  final String title;
  final String subtitle;
  final String connectType;
  final String value;
  final bool hasConnectValue;
  final bool isProject, isRecruiter;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Image.asset('assets/png/rectangle.png'),
              ),
              Expanded(
                child: AnimatedTileContainer(
                  isProject: isProject,
                  isRecruiter: isRecruiter,
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
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: hasConnectValue
              ? AnimatedTileContainer(
                  isProject: isProject,
                  isRecruiter: isRecruiter,
                  child1: Container(
                    width: double.infinity,
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
                        SelectableText(value,
                            style: AppTextStyle.anotationBody),
                      ],
                    ),
                  ),
                  child2: Container(
                    width: double.infinity,
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
                        SelectableText(value,
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

class MobileConnectTiles extends StatelessWidget {
  const MobileConnectTiles({
    super.key,
    required this.title,
  });

  final String title;

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
                child: Image.asset('assets/png/rectangle.png'),
              ),
              Text(
                title,
                style: AppTextStyle.mobileBody.copyWith(fontSize: 44),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
