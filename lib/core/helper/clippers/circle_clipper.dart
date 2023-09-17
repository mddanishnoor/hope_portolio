import 'dart:math';

import 'package:flutter/material.dart';

class CircleClipper extends CustomClipper<Path> {
  final Offset position;
  final double radius;

  CircleClipper(
    this.position,
    this.radius,
  );

  @override
  Path getClip(
    Size size,
  ) {
    final Path path = Path();

    var Size(:width, :height) = size;

    var (centerX, centerY) = (width / 2, height / 2);

    var Offset(dx: x, dy: y) = position;

    path.moveTo(x, y);

    var rect = Rect.fromCenter(
        center: Offset(x, y), width: radius * 2, height: radius * 2);

    path.addArc(rect, 0, 2 * pi);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    var Offset(dx: x, dy: y) = position;

    var Offset(dx: oldX, dy: oldY) = (oldClipper as CircleClipper).position;

    return x != oldX || y != oldY;
  }
}
