import 'package:flutter/material.dart';

import '../constant/theme/pallete.dart';
import '../constant/theme/styles.dart';

class BlackTileWidget extends StatelessWidget {
  const BlackTileWidget({
    super.key,
    required this.size,
    required this.label,
  });

  final Size size;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 65,
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Palette.white_30,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.105,
      ),
      child: Text(
        label,
        style: AppTextStyle.listExtended,
      ),
    );
  }
}
