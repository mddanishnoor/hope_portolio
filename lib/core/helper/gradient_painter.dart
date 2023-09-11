import 'dart:developer';

import 'package:flutter/material.dart';

class GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  GradientPainter(
      {required this.strokeWidth,
      required this.radius,
      required this.gradient});

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    Rect outerRect = Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height);
    var outerRRect =
        RRect.fromRectAndRadius(outerRect, Radius.circular(radius));

    // create inner rectangle smaller by strokeWidth
    log("WIdth :${size.width.toString()}");
    log("Height ${size.height.toString()}");
    log("strockwi ${strokeWidth.toString()}");
    var innerCenter = Offset((size.width - (strokeWidth * 2)) / 2,
        (size.height - (strokeWidth * 2)) / 2);
    Rect innerRect = Rect.fromCenter(
        center: innerCenter,
        width: size.width - strokeWidth,
        height: size.height - strokeWidth);
    var innerRRect = RRect.fromRectAndRadius(
        innerRect, Radius.circular(radius - (strokeWidth * 2)));

    // apply gradient shader
    _paint.shader = gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
