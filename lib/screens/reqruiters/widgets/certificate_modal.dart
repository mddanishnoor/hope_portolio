import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constant/theme/pallete.dart';

class CertificateViewer extends StatefulWidget {
  const CertificateViewer({super.key});

  @override
  State<CertificateViewer> createState() => _CertificateViewerState();
}

class _CertificateViewerState extends State<CertificateViewer> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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

                        if (selectedIndex == 0) {
                          setState(() {
                            selectedIndex = 1;
                          });
                        } else {
                          setState(() {
                            selectedIndex = 0;
                          });
                        }
                        Timer(const Duration(seconds: 2), () {
                          cancel();
                        });
                      },
                      child: const CircleAvatar(
                        backgroundColor: Palette.bgBlack,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Palette.notWhite,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'PREVIOUS\nCERTIFICATE',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.archivo(
                          fontSize: 9, color: Palette.hWhite),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Image.asset(
                certificates[selectedIndex],
                fit: BoxFit.contain,
              )),
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => context.pop(),
                      child: const CircleAvatar(
                        backgroundColor: Palette.bgBlack,
                        child: Icon(
                          Icons.close,
                          color: Palette.notWhite,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
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

                            if (selectedIndex == 0) {
                              setState(() {
                                selectedIndex = 1;
                              });
                            } else {
                              setState(() {
                                selectedIndex = 0;
                              });
                            }
                            Timer(const Duration(seconds: 2), () {
                              cancel();
                            });
                          },
                          child: const CircleAvatar(
                            backgroundColor: Palette.bgBlack,
                            child: Center(
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Palette.notWhite,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Next\nCERTIFICATE',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.archivo(
                              fontSize: 9, color: Palette.hWhite),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

List<String> certificates = [
  'assets/png/cert_01.jpg',
  'assets/png/cert_02.jpg'
];
