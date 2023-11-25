import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/reqruiters_provider.dart';
import 'widgets/helping_widget.dart';
import 'widgets/req_about_widget.dart';

class RecruitersYellow extends StatelessWidget {
  const RecruitersYellow(
      {super.key,
      required this.scrollController,
      required this.scrollController2});
  final ScrollController scrollController;
  final ScrollController scrollController2;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
