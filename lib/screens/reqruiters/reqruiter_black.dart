import 'package:flutter/material.dart';
import 'package:portfolio/screens/reqruiters/widgets/req_about_widget.dart';
import 'package:provider/provider.dart';

import '../../providers/reqruiters_provider.dart';
import 'widgets/helping_widget.dart';

class RecruitersBlack extends StatelessWidget {
  const RecruitersBlack(
      {super.key, required this.size, required this.scrollController2});

  final Size size;
  final ScrollController scrollController2;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<RecruitersProvider>(builder: (context, controller, _) {
        return Column(
          children: [
            HelpingWidget(
              size: size,
            ),
            ReqAboutMeWidget(size: size, scrollController: scrollController2)
          ],
        );
      }),
    );
  }
}
