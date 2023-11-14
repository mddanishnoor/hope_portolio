import 'package:flutter/material.dart';

import '../constant/theme/pallete.dart';
import '../constant/theme/styles.dart';

class CustomElevatedButton extends StatefulWidget {
  const CustomElevatedButton({
    super.key,
    required this.label,
    this.labelStyle,
    required this.isYellow,
  });
  final String label;
  final bool isYellow;
  final TextStyle? labelStyle;

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // frame2ha7 (22:498)
      margin: const EdgeInsets.fromLTRB(0, 15, 0, 12),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),

      decoration: BoxDecoration(
        color: widget.isYellow ? Palette.bgBlack : Palette.yellow,
        border: Border.all(
            color: widget.isYellow ? Palette.hYellow : Colors.transparent),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Text(
          widget.label,
          style: widget.labelStyle ??
              AppTextStyle.buttonTextStyle.copyWith(
                color: !widget.isYellow ? Palette.bgBlack : Palette.yellow,
              ),
        ),
      ),
    );
  }
}
