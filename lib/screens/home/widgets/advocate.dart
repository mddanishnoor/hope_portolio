import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../../core/constant/theme/pallete.dart';
import '../../../core/constant/theme/styles.dart';
import '../../../core/widgets/landing_widget.dart';
import '../../../providers/cursor_provider.dart';

class AdvocateWidget extends StatefulWidget {
  const AdvocateWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<AdvocateWidget> createState() => _AdvocateWidgetState();
}

class _AdvocateWidgetState extends State<AdvocateWidget> {
  final videoController = VideoPlayerController.asset('assets/video/web.mp4');
  @override
  void initState() {
    videoController.initialize().then((value) => videoController.play());
    videoController.setLooping(true);
    videoController.setVolume(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LandingWidget(
      decoration: const BoxDecoration(
          // image: DecorationImage(
          //     opacity: 0.4,
          //     image: AssetImage('assets/png/hero_bg.jpeg'),
          //     fit: BoxFit.cover),
          ),
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Transform.scale(
              scale: 1.05,
              child: Stack(
                children: [
                  AbsorbPointer(
                      absorbing: true, child: VideoPlayer(videoController)),
                  Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black.withOpacity(0.8)),
                ],
              ),
            ),
          ),
          Positioned(
            left: widget.size.height * 0.0241,
            top: widget.size.height * 0.063,
            child: Text(
              'HOPE',
              textAlign: TextAlign.center,
              style: GoogleFonts.bebasNeue(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                height: 0.8599999547,
                color: Palette.white,
              ),
            ),
          ),
          Column(
            children: [
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child:
                    Consumer<CursorProvider>(builder: (context, provider, _) {
                  return MouseRegion(
                    onEnter: (event) => provider.toggleMagnify(true),
                    onExit: (event) => provider.toggleMagnify(false),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('MOHAMMAD SAJJAD RAZA',
                              textAlign: TextAlign.center,
                              style: AppTextStyle.anotation),
                          const SizedBox(
                            height: 16,
                          ),
                          Text('ADVOCATE',
                              overflow: TextOverflow.fade,
                              style: AppTextStyle.heading
                                  .copyWith(color: Palette.hYellow)),
                          Text('FOR\nUSERS',
                              textAlign: TextAlign.center,
                              style: AppTextStyle.heading),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

class MobileAdvocateWidget extends StatefulWidget {
  const MobileAdvocateWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<MobileAdvocateWidget> createState() => _MobileAdvocateWidgetState();
}

class _MobileAdvocateWidgetState extends State<MobileAdvocateWidget> {
  final videoController =
      VideoPlayerController.asset('assets/video/mobile.mp4');
  @override
  void initState() {
    videoController.initialize().then((value) => (
          videoController.play(),
          videoController.setLooping(true),
          videoController.setVolume(0)
        ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LandingWidget(
      decoration: const BoxDecoration(
          // image: DecorationImage(
          //     opacity: 0.4,
          //     image: AssetImage('assets/png/hero_bg.jpeg'),
          //     fit: BoxFit.cover),
          ),
      child: Container(
        child: Stack(
          children: [
            AbsorbPointer(absorbing: true, child: VideoPlayer(videoController)),
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black.withOpacity(0.8)),
            Positioned(
              left: widget.size.height * 0.0241,
              top: widget.size.height * 0.063,
              child: Text(
                'HOPE',
                textAlign: TextAlign.center,
                style: GoogleFonts.bebasNeue(
                  fontSize: 21.961,
                  fontWeight: FontWeight.w400,
                  height: 0.8599999547,
                  color: Palette.white,
                ),
              ),
            ),
            Column(
              children: [
                const Spacer(),
                Align(
                  alignment: Alignment.center,
                  child:
                      Consumer<CursorProvider>(builder: (context, provider, _) {
                    return MouseRegion(
                      onEnter: (event) => provider.toggleMagnify(true),
                      onExit: (event) => provider.toggleMagnify(false),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('MOHAMMAD SAJJAD RAZA',
                                textAlign: TextAlign.center,
                                style: AppTextStyle.mobileAnnotation),
                            const SizedBox(
                              height: 8,
                            ),
                            Text('ADVOCATE',
                                overflow: TextOverflow.fade,
                                style: AppTextStyle.mobileHeading
                                    .copyWith(color: Palette.hYellow)),
                            Text('FOR\nUSERS',
                                textAlign: TextAlign.center,
                                style: AppTextStyle.mobileHeading),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
