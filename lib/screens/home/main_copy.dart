import 'package:flutter/material.dart';
import 'package:portfolio/providers/cursor_provider.dart';
import 'package:provider/provider.dart';

import '../../core/helper/custom_scroll_physics.dart';
import 'widgets/about_me.dart';
import 'widgets/advocate.dart';
import 'widgets/connect_widget.dart';
import 'widgets/favourite_projects.dart';
import 'widgets/my_moto.dart';
import 'widgets/what_i_do.dart';

class BlackCopy extends StatelessWidget {
  const BlackCopy({
    super.key,
    required this.size,
    required this.scrollController2,
  });

  final Size size;
  final ScrollController scrollController2;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: true,
      physics: const CustomPhysics(),
      child: Consumer<CursorProvider>(builder: (context, provider, _) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            size.width > 600
                ? AdvocateWidget(size: size)
                : MobileAdvocateWidget(size: size),
            size.width > 600
                ? AboutMeWidget(
                    size: size,
                    scrollController: scrollController2,
                  )
                : MobileAboutMeWidget(
                    size: size, scrollController: scrollController2),
            size.width > 600
                ? WhatIDoWidget(
                    size: size, scrollController2: scrollController2)
                : MobileWhatIDoWidget(
                    size: size, scrollController2: scrollController2),
            size.width > 600
                ? FavoriteProjects(size: size)
                : MobileFavoriteProjects(size: size),
            size.width > 600 ? const MyMoto() : const MobileMyMoto(),
            size.width > 600 ? Connect(size: size) : MobileConnect(size: size)
          ],
        );
      }),
    );
  }
}
