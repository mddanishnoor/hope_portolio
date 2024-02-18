import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:portfolio/core/widgets/running_text_widget.dart';
import 'package:portfolio/providers/reqruiters_provider.dart';
import 'package:provider/provider.dart';

class ReqRunningAnimatedTileContainer extends StatefulWidget {
  const ReqRunningAnimatedTileContainer(
      {super.key,
      this.height = 65,
      this.width = double.infinity,
      required this.child1,
      required this.child2,
      required this.scrollOffset,
      required this.multiplier});
  final double? width, height;
  final Widget child1, child2;
  final double scrollOffset;
  final double multiplier;

  @override
  State<ReqRunningAnimatedTileContainer> createState() =>
      _ReqRunningAnimatedTileContainerState();
}

class _ReqRunningAnimatedTileContainerState
    extends State<ReqRunningAnimatedTileContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> width, height;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    width = TweenSequence<double>(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween(begin: 0, end: widget.width), weight: 50),
    ]).animate(_controller);
    height = TweenSequence<double>(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween(begin: 0, end: widget.height), weight: 50),
    ]).animate(_controller);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => (
        _controller.forward(),
        context.read<RecruitersProvider>().toggleHide(true)
      ),
      onExit: (event) => (
        _controller.reverse(),
        context.read<RecruitersProvider>().toggleHide(false)
      ),
      child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: Stack(
            children: [
              RunningText(
                  //  key: widgetKey,
                  index: (3.5) * widget.multiplier,
                  size: MediaQuery.of(context).size,
                  offset: widget.scrollOffset,
                  maxLines: 1,
                  height: 65,
                  child: widget.child1),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                    height: height.value,
                    width: width.value,
                    child: widget.child2),
              )
            ],
          )),
    );
  }
}

class MobileReqRunningAnimatedTileContainer extends StatefulWidget {
  const MobileReqRunningAnimatedTileContainer(
      {super.key,
      this.height = 47,
      this.width = double.infinity,
      required this.child,
      required this.scrollOffset,
      required this.multiplier});
  final double? width, height;
  final Widget child;
  final double scrollOffset;
  final double multiplier;

  @override
  State<MobileReqRunningAnimatedTileContainer> createState() =>
      _MobileReqRunningAnimatedTileContainerState();
}

class _MobileReqRunningAnimatedTileContainerState
    extends State<MobileReqRunningAnimatedTileContainer>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // log(widget.scrollOffset.toString());
    return SizedBox(
        width: widget.width,
        height: widget.height,
        child: MobileRunningText(
            index: (3.5) * widget.multiplier,
            size: MediaQuery.of(context).size,
            offset: widget.scrollOffset,
            maxLines: 1,
            height: widget.height,
            child: widget.child));
  }
}

class ReqAnimatedTileContainer extends StatefulWidget {
  const ReqAnimatedTileContainer({
    super.key,
    this.height = 65,
    required this.child1,
    required this.child2,
  });
  final double? height;
  final Widget child1, child2;

  @override
  State<ReqAnimatedTileContainer> createState() =>
      _ReqAnimatedTileContainerState();
}

class _ReqAnimatedTileContainerState extends State<ReqAnimatedTileContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> height;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    // width = TweenSequence<double>(<TweenSequenceItem<double>>[
    //   TweenSequenceItem(tween: Tween(begin: 0, end: widget.width), weight: 50),
    // ]).animate(_controller);
    height = TweenSequence<double>(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween(begin: 0, end: widget.height), weight: 50),
    ]).animate(_controller);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => (
        _controller.forward(),
        context.read<RecruitersProvider>().toggleHide(true)
      ),
      onExit: (event) => (
        _controller.reverse(),
        context.read<RecruitersProvider>().toggleHide(false)
      ),
      child: SizedBox(
          height: widget.height,
          child: Stack(
            children: [
              widget.child1,
              SizedBox(height: height.value, child: widget.child2)
            ],
          )),
    );
  }
}
