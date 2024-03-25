import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/theme/pallete.dart';
import 'package:portfolio/providers/reqruiters_provider.dart';
import 'package:provider/provider.dart';
import '../../../core/constant/theme/styles.dart';
import '../../../core/widgets/landing_widget.dart';

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
    return widget.size.width > 600 ? webWidget() : mobileWidget();
  }

  Consumer<RecruitersProvider> webWidget() {
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
                          style: AppTextStyle.annotation,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        //[]

// [ ]
                        // Text(
                        //   'I am a fresh graduate with a masters degree in UX/UI design, (think of design thinking)                ',
                        //   style: AppTextStyle.body,
                        // )
                        RichText(
                            text: TextSpan(
                                text: "Hey! I'm an",
                                style: AppTextStyle.body.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                              // TextSpan(
                              //     text: "Mohammad Sajjad Raza,",
                              //     style: AppTextStyle.body
                              //         .copyWith(color: Palette.hYellow)),
                              const TextSpan(
                                  text:
                                      " engineer turned product designer in Delhi, India."),
                              //
                              const TextSpan(
                                  text:
                                      "\n\nMy mission? helping folks work smarter and feel more confident through"),
                              TextSpan(
                                  text: " designs that tap into psychology.",
                                  style: AppTextStyle.body
                                      .copyWith(color: Palette.hYellow)),
                            ]))
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

  LandingWidget mobileWidget() {
    return LandingWidget(
        key: widgetKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                  RichText(
                      text: TextSpan(
                          text: "Hey! I'm an",
                          style: AppTextStyle.mobileBody.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                        const TextSpan(
                            text:
                                " engineer turned product designer in Delhi, India."),
                        //
                        const TextSpan(
                            text:
                                "\n\nMy mission? helping folks work smarter and feel more confident through"),
                        TextSpan(
                            text: " designs that tap into psychology.",
                            style: AppTextStyle.mobileBody
                                .copyWith(color: Palette.hYellow)),
                      ]))
                ],
              ),
            ],
          ),
        ));
  }
}
