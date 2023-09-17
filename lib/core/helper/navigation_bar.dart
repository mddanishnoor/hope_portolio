import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 17),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4,
            sigmaY: 4,
          ),
          child: Container(
            // landingpagenavbarstate31Mh (1:13)
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            // width: size.width * 0.31844,
            height: 49,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: const Border(),
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[Color(0x33ffffff), Color(0x00ffffff)],
                stops: <double>[0, 1],
              ),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(-0.5, 0),
                  blurRadius: 2,
                  spreadRadius: -1,
                  blurStyle: BlurStyle.outer,
                  color: Color.fromRGBO(255, 255, 255, 0.229),
                ),
                BoxShadow(
                    offset: Offset(-0.5, 0),
                    blurRadius: 2,
                    spreadRadius: -1,
                    blurStyle: BlurStyle.outer,
                    color: Color.fromRGBO(255, 255, 255, 0.153)),
              ],
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                NavButton(label: 'About me'),
                SizedBox(
                  width: 5,
                ),
                NavButton(label: 'Project'),
                SizedBox(
                  width: 5,
                ),
                NavButton(label: 'Connect'),
                SizedBox(
                  width: 5,
                ),
                NavButton(label: 'For requruiters')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  const NavButton({
    super.key,
    this.onTap,
    required this.label,
  });
  final void Function()? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 40,
          sigmaY: 40,
        ),
        child: Container(
          // width: double.infinity,
          padding: const EdgeInsets.all(10),
          height: 39,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color.fromRGBO(0, 0, 0, 0.8),
                Color.fromRGBO(0, 0, 0, 0.4)
              ],
              stops: <double>[0, 1],
            ),
            boxShadow: const [
              BoxShadow(
                offset: Offset(-0.5, 0),
                blurRadius: 2,
                spreadRadius: -1,
                blurStyle: BlurStyle.outer,
                color: Color.fromRGBO(255, 255, 255, 0.628),
              ),
              BoxShadow(
                  offset: Offset(-0.5, 0),
                  blurRadius: 2,
                  spreadRadius: -1,
                  blurStyle: BlurStyle.outer,
                  color: Color.fromRGBO(255, 255, 255, 0.553)),
            ],
          ),
          child: Center(
            child: Text(
              label,
              style: GoogleFonts.syne(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.2,
                color: const Color(0xffece5d3),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
