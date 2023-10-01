import 'package:flutter/material.dart';

class TileContainer extends StatefulWidget {
  const TileContainer(
      {super.key,
      this.height = 65,
      this.width = double.infinity,
      required this.child1,
      required this.child2});
  final double? width, height;
  final Widget child1, child2;

  @override
  State<TileContainer> createState() => _TileContainerState();
}

class _TileContainerState extends State<TileContainer>
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
      onEnter: (event) => _controller.forward(),
      onExit: (event) => _controller.reverse(),
      child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: Stack(
            children: [
              widget.child1,
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
