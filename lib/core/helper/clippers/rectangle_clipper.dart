import 'package:flutter/material.dart';

class RectangleClipper extends CustomClipper<Path> {
  final Size constraints;
  RectangleClipper(
    this.constraints,
  );

  @override
  Path getClip(
    Size size,
  ) {
    final Path path = Path();

    var Size(:width, :height) = size;

    var (cx, cy) = (width / 2, height / 2);

    var (w, h) = (constraints.width, constraints.height);

    path.moveTo(cx, cy);

    var rect = Rect.fromLTWH(0, 0, w, h);

    path.addRect(rect);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    Size c = (constraints);

    var oc = (oldClipper as RectangleClipper).constraints;

    return oc != c;
  }
}
