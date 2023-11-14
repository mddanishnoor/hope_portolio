import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/theme/pallete.dart';
import '../constant/theme/styles.dart';

class YellowTileWidget extends StatelessWidget {
  const YellowTileWidget({
    super.key,
    required this.size,
    required this.label,
    required this.secondLabel,
  });

  final Size size;
  final String label;
  final String secondLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 65,
      decoration: const BoxDecoration(
        color: Palette.hYellow,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Palette.white_30,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.105,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: AppTextStyle.listExtended.copyWith(color: Palette.bgBlack),
            ),
          ),
          // const Spacer(),
          Text(
            secondLabel,
            style: GoogleFonts.archivo(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Palette.bgBlack),
          )
        ],
      ),
    );
  }
}
