import 'package:flutter/material.dart';
import 'package:portfolio/providers/cursor_provider.dart';
import 'package:provider/provider.dart';

import 'about_me.dart';
import 'advocate.dart';
import 'connect/connect_widget.dart';
import 'favourite_projects.dart';
import 'my_moto.dart';
import 'what_i_do.dart';

class MainCopy extends StatelessWidget {
  const MainCopy({
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
            FavouriteProjects(size: size),
            const MyMoto(),
            Connect(size: size)
          ],
        );
      }),
    );
  }
}
