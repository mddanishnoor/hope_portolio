import 'package:flutter/material.dart';
import 'package:portfolio/providers/reqruiters_provider.dart';
import 'package:portfolio/screens/home/widgets/favourite_projects.dart';
import 'package:portfolio/screens/reqruiters/widgets/core_competency_widget.dart';
import 'package:portfolio/screens/reqruiters/widgets/experience_widget.dart';
import 'package:portfolio/screens/reqruiters/widgets/req_about_widget.dart';
import 'package:provider/provider.dart';
import '../home/widgets/connect_widget.dart';
import '../home/widgets/my_moto.dart';
import 'widgets/certifcate_widget.dart';
import 'widgets/education_widget.dart';
import 'widgets/helping_user_widget.dart';
import 'widgets/req_what_i_do.dart';

class RecruitersBlack extends StatelessWidget {
  const RecruitersBlack({
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
      child: Consumer<RecruitersProvider>(builder: (context, provider, _) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            HelpingUserWidget(size: size),
            ReqAboutMeWidget(
              size: size,
              scrollController: scrollController2,
            ),
            ReqWhatIDoWidget(size: size, scrollController2: scrollController2),
            CertificateWidget(size: size),
            ExperienceWidget(size: size, scrollController2: scrollController2),
            EducationWidget(size: size, scrollController2: scrollController2),
            FavoriteProjects(size: size),
            CoreCompetency(
              size: size,
            ),
            const MyMoto(),
            Connect(size: size)
          ],
        );
      }),
    );
  }
}
