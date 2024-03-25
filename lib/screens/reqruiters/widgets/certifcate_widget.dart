import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/providers/reqruiters_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/theme/pallete.dart';
import '../../../core/constant/theme/styles.dart';
import '../../../core/widgets/landing_widget.dart';
import 'certificate_modal.dart';

class CertificateWidget extends StatelessWidget {
  const CertificateWidget({
    super.key,
    required this.size,
    this.isYellow = false,
  });

  final Size size;
  final bool isYellow;

  @override
  Widget build(BuildContext context) {
    return size.width > 600 ? webWidget(context) : mobileWidget(context);
  }

  Widget webWidget(BuildContext context) {
    return MouseRegion(
        onEnter: (event) => context.read<RecruitersProvider>().toggleHide(true),
        onExit: (event) => context.read<RecruitersProvider>().toggleHide(false),
        child: WebCertificate(size: size, isYellow: isYellow));
  }

  LandingWidget mobileWidget(BuildContext context) {
    return LandingWidget(
      height: size.height * 0.6,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Certificate',
              style: AppTextStyle.mobileAnnotation,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              // height: size.height * 0.84,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Palette.borderGrey)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.065,
                      vertical: size.height * 0.0299,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'GOOGLE UX DESIGN PROFESSIONAL CERTIFICATE',
                          style: GoogleFonts.archivo(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            height: 0.86,
                            letterSpacing: -1.42,
                            color: Palette.hWhite,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            YellowOutlinedButton(
                              onTap: () {
                                var cancel = BotToast.showWidget(
                                  toastBuilder: (cancelFunc) => Container(
                                    color: Palette.bgBlack.withOpacity(0.9),
                                    width: double.infinity,
                                    height: double.infinity,
                                    padding: const EdgeInsets.all(50),
                                    child: Center(
                                      child: Container(
                                        width: 200,
                                        height: 200,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: AssetImage(
                                                'assets/png/loder_transparent.gif'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );

                                showDialog(
                                    context: context,
                                    builder: (context) =>
                                        const CertificateViewer());
                                Timer(const Duration(seconds: 2), () {
                                  cancel();
                                });
                              },
                              label: 'Verify >>',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WebCertificate extends StatefulWidget {
  const WebCertificate({
    super.key,
    required this.size,
    required this.isYellow,
  });

  final Size size;
  final bool isYellow;

  @override
  State<WebCertificate> createState() => _WebCertificateState();
}

class _WebCertificateState extends State<WebCertificate> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() {
        isHovered = true;
      }),
      onExit: (event) => setState(() {
        isHovered = false;
      }),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.size.width * 0.105),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CERTIFICATIONS ',
              style: AppTextStyle.annotation,
            ),
            const SizedBox(
              height: 10,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              // height: size.height * 0.84,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: isHovered ? Palette.hYellow : null,
                  border: Border.all(width: 1, color: Palette.borderGrey)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: widget.size.width * 0.05,
                  vertical: widget.size.height * 0.0299,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isHovered
                          ? 'Yes I’m google\ncertified'
                          : 'Google UX Design\nProfessional Certificate',
                      style: AppTextStyle.listExtended.copyWith(
                          fontSize: 45,
                          color: isHovered ? Palette.black : null),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        var cancel = BotToast.showWidget(
                          toastBuilder: (cancelFunc) => Container(
                            color: Palette.bgBlack.withOpacity(0.9),
                            width: double.infinity,
                            height: double.infinity,
                            padding: const EdgeInsets.all(50),
                            child: Center(
                              child: Container(
                                width: 200,
                                height: 200,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: AssetImage(
                                        'assets/png/loder_transparent.gif'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );

                        showDialog(
                            context: context,
                            builder: (context) => const CertificateViewer());
                        Timer(const Duration(seconds: 2), () {
                          cancel();
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.0,
                                color: !(isHovered || widget.isYellow)
                                    ? Palette.hYellow
                                    : Palette.bgBlack),
                            borderRadius: BorderRadius.circular(6),
                            color: (isHovered || widget.isYellow)
                                ? Palette.hYellow
                                : Palette.bgBlack
                            // You can set the background color here.
                            // Example: color: buttonColor,
                            ),
                        child: Center(
                            child: Text(
                          'Verify >>',
                          style: AppTextStyle.buttonTextStyle.copyWith(
                              color: (isHovered || widget.isYellow)
                                  ? Palette.bgBlack
                                  : Palette.hYellow),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class YellowOutlinedButton extends StatefulWidget {
  const YellowOutlinedButton({
    super.key,
    this.onTap,
    required this.label,
    this.labelStyle,
    this.isYellow = false,
  });
  final Function()? onTap;
  final String label;
  final TextStyle? labelStyle;
  final bool isYellow;

  @override
  State<YellowOutlinedButton> createState() => _YellowOutlinedButtonState();
}

class _YellowOutlinedButtonState extends State<YellowOutlinedButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        if (widget.isYellow) {
          return;
        }
        setState(() {
          isHovered = true;
          context.read<RecruitersProvider>().toggleHide(true);
        });
      },
      onExit: (_) {
        if (widget.isYellow) {
          return;
        }
        setState(() {
          isHovered = false;
          context.read<RecruitersProvider>().toggleHide(false);
        });
      },
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1.0,
                  color: !(isHovered || widget.isYellow)
                      ? Palette.hYellow
                      : Palette.bgBlack),
              borderRadius: BorderRadius.circular(6),
              color: (isHovered || widget.isYellow)
                  ? Palette.hYellow
                  : Palette.bgBlack
              // You can set the background color here.
              // Example: color: buttonColor,
              ),
          child: Center(
              child: Text(
            widget.label,
            style: widget.labelStyle ??
                AppTextStyle.buttonTextStyle.copyWith(
                    color: (isHovered || widget.isYellow)
                        ? Palette.bgBlack
                        : Palette.hYellow),
          )),
        ),
      ),
    );
  }
}
