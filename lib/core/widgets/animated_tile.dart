import 'package:flutter/material.dart';
import 'package:portfolio/core/widgets/running_text_widget.dart';
import 'package:portfolio/providers/cursor_provider.dart';
import 'package:portfolio/providers/project_provider.dart';
import 'package:portfolio/providers/reqruiters_provider.dart';
import 'package:provider/provider.dart';

class RunningAnimatedTileContainer extends StatefulWidget {
  const RunningAnimatedTileContainer(
      {super.key,
      this.height = 65,
      this.width = double.infinity,
      required this.child1,
      required this.child2,
      required this.scrollOffset,
      required this.multiplier,
      this.isRecruiter = false});
  final double? width, height;
  final Widget child1, child2;
  final double scrollOffset;
  final double multiplier;
  final bool isRecruiter;

  @override
  State<RunningAnimatedTileContainer> createState() =>
      _RunningAnimatedTileContainerState();
}

class _RunningAnimatedTileContainerState
    extends State<RunningAnimatedTileContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> width, height;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
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
        widget.isRecruiter
            ? context.read<RecruitersProvider>().toggleHide(true)
            : context.read<CursorProvider>().toggleHide(true)
      ),
      onExit: (event) => (
        _controller.reverse(),
        widget.isRecruiter
            ? context.read<RecruitersProvider>().toggleHide(false)
            : context.read<CursorProvider>().toggleHide(false)
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

class AnimatedTileContainer extends StatefulWidget {
  const AnimatedTileContainer({
    super.key,
    this.height = 65,
    required this.child1,
    required this.child2,
    this.isProject = false,
    this.isRecruiter = false,
  });
  final double? height;
  final Widget child1, child2;
  final bool isProject, isRecruiter;

  @override
  State<AnimatedTileContainer> createState() => _AnimatedTileContainerState();
}

class _AnimatedTileContainerState extends State<AnimatedTileContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> height;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 50));
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
        widget.isProject
            ? context.read<ProjectProvider>().toggleHide(true)
            : widget.isRecruiter
                ? context.read<RecruitersProvider>().toggleHide(true)
                : context.read<CursorProvider>().toggleHide(true)
      ),
      onExit: (event) => (
        _controller.reverse(),
        widget.isProject
            ? context.read<ProjectProvider>().toggleHide(false)
            : widget.isRecruiter
                ? context.read<RecruitersProvider>().toggleHide(false)
                : context.read<CursorProvider>().toggleHide(false)
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
