// import 'package:flutter/material.dart';

// class RunningClipper extends CustomClipper<Path>{
//   final Offset offset;
//   RunningClipper(
//     this.offset,
//   );

//   @override
//   Path getPath(Size size){
//     final Path path = Path();

//     var Size(:width, :height) = size;

//     var (centerX, centerY) = (width / 2, height / 2);

//     var Offset(dx: x, dy: y) = position;

//     path.moveTo(x, y);

//     var rect = Rect.fromCenter(
//         center: Offset(x, y), width: radius * 2, height: radius * 2);

//     path.addArc(rect, 0, 2 * pi);
//     path.close();
//     return path;
//   }
// }