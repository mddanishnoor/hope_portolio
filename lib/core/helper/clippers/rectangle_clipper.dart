// import 'package:flutter/material.dart';

// class RectangleClipper extends CustomClipper<Path> {
//   final Size constraints;
//   final Offset position;
//   RectangleClipper(
//     this.constraints,
//     this.position,
//   );

//   @override
//   Path getClip(
//     Size size,
//   ) {
//     final Path path = Path();

//     var Size(:width, :height) = size;

//     var (cx, cy) = (width / 2, height / 2);

//     var (w, h) = (constraints.width, constraints.height);

//     path.moveTo(position.dx, position.dy);

//     var rect = Rect.fromLTWH(w, h, width, height);

//     path.addRect(rect);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     Size c = (constraints);

//     var oc = (oldClipper as RectangleClipper).constraints;

//     return oc != c;
//   }
// }
