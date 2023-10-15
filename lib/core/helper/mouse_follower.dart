import 'package:flutter/material.dart';

import 'clippers/circle_clipper.dart';

class MouseFollower extends ImplicitlyAnimatedWidget {
  final Offset position;
  final Widget child;
  final double radius;
  final double height;
  final double width;

  const MouseFollower(
      {required this.position,
      required this.child,
      required this.radius,
      required this.height,
      required this.width,
      super.key})
      : super(
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 300),
        );

  @override
  ImplicitlyAnimatedWidgetState createState() => _MouseFollowerState();
}

class _MouseFollowerState extends AnimatedWidgetBaseState<MouseFollower> {
  Tween<Offset>? _positionTween;
  Tween<double>? _radiusTween;
  Tween<double>? _heightTween;
  Tween<double>? _widthTween;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CircleClipper(
          _positionTween!
              .chain(CurveTween(curve: Curves.easeIn))
              .evaluate(animation),
          _radiusTween!
              .chain(CurveTween(curve: Curves.easeIn))
              .evaluate(animation)),
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    _positionTween = (visitor(_positionTween, widget.position,
            (dynamic value) => Tween<Offset>(begin: value as Offset))
        as Tween<Offset>?)!;
    _radiusTween = (visitor(_radiusTween, widget.radius,
            (dynamic value) => Tween<double>(begin: value as double))
        as Tween<double>?);
    _heightTween = (visitor(_heightTween, widget.height,
            (dynamic value) => Tween<double>(begin: value as double))
        as Tween<double>?)!;
    _widthTween = (visitor(_widthTween, widget.width,
            (dynamic value) => Tween<double>(begin: value as double))
        as Tween<double>?);
  }
}
