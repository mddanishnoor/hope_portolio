import 'package:flutter/material.dart';

import '../constant/theme/pallete.dart';

class RunningText extends StatefulWidget {
  const RunningText(
      {super.key,
      required this.child,
      required this.size,
      required this.offset,
      required this.maxLines,
      this.height,
      required this.index});
  final Widget child;
  final Size size;
  final double offset;
  final double maxLines;
  final double? height;
  final double index;

  @override
  State<RunningText> createState() => _RunningTextState();
}

class _RunningTextState extends State<RunningText> {
  // static final GlobalKey widgetKey = GlobalKey();
  RenderBox? renderBox;
  Offset? widgetOffset;
  // @override
  // void didChangeDependencies() {
  //   renderBox = (widget.key as GlobalKey).currentContext?.findRenderObject()
  //       as RenderBox;
  //   widgetOffset = renderBox?.localToGlobal(Offset.zero);
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        AnimatedPositioned(
          duration: const Duration(milliseconds: 350),
          right:
              -((widgetOffset?.dy ?? (widget.offset - (220 * widget.index))) *
                  1.3 *
                  (3 / widget.size.height) *
                  widget.size.width),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            for (int i = 1; i <= widget.maxLines; i++)
              Container(
                width: (widget.size.width * 0.8) * i,
                height: widget.height ?? 62,
                decoration: BoxDecoration(
                  backgroundBlendMode: BlendMode.darken,
                  color: Palette.black.withOpacity(0.5),
                ),
              ),
          ]),
        )
      ],
    );
  }
}
