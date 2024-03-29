import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/theme/pallete.dart';
import '../../../core/constant/theme/styles.dart';
import '../../../core/widgets/landing_widget.dart';
import '../../../core/widgets/running_text_widget.dart';
import '../../../providers/cursor_provider.dart';

class AboutMeWidget extends StatefulWidget {
  const AboutMeWidget({
    super.key,
    required this.size,
    required this.scrollController,
  });

  final Size size;
  final ScrollController scrollController;

  @override
  State<AboutMeWidget> createState() => _AboutMeWidgetState();
}

class _AboutMeWidgetState extends State<AboutMeWidget> {
  // double _y = 0;
  // @override
  // void initState() {
  //   widget.scrollController.addListener(() {
  //     setState(() {});
  //   });
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   widget.scrollController.removeListener(() {});
  //   super.dispose();
  // }

  GlobalKey widgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer<CursorProvider>(builder: (context, provider, _) {
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
                          style: AppTextStyle.annotation,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        RunningText(
                          index: 1,
                          size: widget.size,
                          offset: provider.scrollOffset,
                          maxLines: 5,
                          child: RichText(
                            text: TextSpan(
                              style: AppTextStyle.body,
                              children: [
                                const TextSpan(
                                  text: 'I am a ',
                                ),
                                TextSpan(
                                  text: 'multidisciplinary',
                                  style: AppTextStyle.body
                                      .copyWith(color: Palette.hYellow),
                                ),
                                const TextSpan(
                                  text:
                                      ' designer creating inclusive experience through empathy and research.',
                                ),
                              ],
                            ),
                          ),
                        )
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

class MobileAboutMeWidget extends StatefulWidget {
  const MobileAboutMeWidget({
    super.key,
    required this.size,
    required this.scrollController,
  });

  final Size size;
  final ScrollController scrollController;

  @override
  State<MobileAboutMeWidget> createState() => _MobileAboutMeWidgetState();
}

class _MobileAboutMeWidgetState extends State<MobileAboutMeWidget> {
  // double _y = 0;
  // @override
  // void initState() {
  //   widget.scrollController.addListener(() {
  //     setState(() {});
  //   });
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   widget.scrollController.removeListener(() {});
  //   super.dispose();
  // }

  GlobalKey widgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer<CursorProvider>(builder: (context, provider, _) {
      return LandingWidget(
          height: MediaQuery.of(context).size.height * 0.6,
          key: widgetKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ABOUT ME',
                      style: AppTextStyle.mobileAnnotation,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    RunningText(
                      index: 1,
                      size: widget.size,
                      offset: provider.scrollOffset,
                      maxLines: 5,
                      child: RichText(
                        text: TextSpan(
                          style: AppTextStyle.mobileBody,
                          children: [
                            const TextSpan(
                              text: 'I am a ',
                            ),
                            TextSpan(
                              text: 'multidisciplinary',
                              style: AppTextStyle.mobileBody
                                  .copyWith(color: Palette.hYellow),
                            ),
                            const TextSpan(
                              text:
                                  ' designer creating inclusive experience through empathy and research.',
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                // const Spacer(),
              ],
            ),
          ));
    });
  }
}
