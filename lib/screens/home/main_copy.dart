import 'package:flutter/material.dart';
import 'package:portfolio/providers/cursor_provider.dart';
import 'package:provider/provider.dart';

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
      child: Consumer<CursorProvider>(builder: (context, provider, _) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            AdvocateWidget(size: size),
            AboutMeWidget(
              size: size,
              scrollController: scrollController2,
            ),
            WhatIDoWidget(size: size, scrollController2: scrollController2),
            FavoriteProjects(size: size),
            const MyMoto(),
            Connect(size: size)
          ],
        );
      }),
    );
  }
}
