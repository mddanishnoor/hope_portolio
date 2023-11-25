import 'package:flutter/material.dart';
import 'package:portfolio/providers/reqruiters_provider.dart';
import 'package:provider/provider.dart';

// import '../../../core/constant/theme/pallete.dart';
import '../../../core/constant/theme/styles.dart';
import '../../../core/widgets/landing_widget.dart';
import '../../../core/widgets/running_text_widget.dart';

class ReqAboutMeWidget extends StatefulWidget {
  const ReqAboutMeWidget({
    super.key,
    required this.size,
    required this.scrollController,
  });

  final Size size;
  final ScrollController scrollController;

  @override
  State<ReqAboutMeWidget> createState() => _ReqAboutMeWidgetState();
}

class _ReqAboutMeWidgetState extends State<ReqAboutMeWidget> {
  GlobalKey widgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer<RecruitersProvider>(builder: (context, provider, _) {
      return LandingWidget(
          key: widgetKey,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: widget.size.width * 0.1046),
            child: Column(
              children: [
                const Spacer(),
                MouseRegion(
                  onEnter: (event) => provider.toggleMagnify(true),
                  onExit: (event) => provider.toggleMagnify(false),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ABOUT ME',
                          style: AppTextStyle.anotation,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        RunningText(
                            index: 1,
                            size: widget.size,
                            offset: provider.scrollOffset,
                            maxLines: 5,
                            child: Text(
                              'I am a fresh graduate with a masters degree in UX/UI design, (think of design thinking)',
                              style: AppTextStyle.body,
                            ))
                      ],
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ));
    });
  }
}
