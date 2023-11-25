import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/reqruiters_provider.dart';

class RecruitersBlack extends StatelessWidget {
  const RecruitersBlack({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<RecruitersProvider>(builder: (context, controller, _) {
        return const Column(
          children: [],
        );
      }),
    );
  }
}
