import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constant/theme/pallete.dart';

abstract class AppTextStyle {
  // anotation Text Style
  static TextStyle anotation = GoogleFonts.archivo(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1,
    letterSpacing: 3.51,
    color: Palette.hWhite,
  );

  static TextStyle mobileAnnotation = GoogleFonts.archivo(
    fontSize: 9,
    fontWeight: FontWeight.w400,
    height: 1,
    letterSpacing: 2.35,
    color: Palette.hWhite,
  );

  // heading Text Style
  static TextStyle heading = GoogleFonts.archivo(
    fontSize: 96,
    fontWeight: FontWeight.w700,
    height: 0.8599999746,
    letterSpacing: -5.28,
    color: Palette.hWhite,
  );
  static TextStyle mobileHeading = GoogleFonts.archivo(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    height: 0.86,
    letterSpacing: -2.42,
    color: Palette.hWhite,
  );
  // body Text Style
  static TextStyle body = GoogleFonts.archivo(
    fontSize: 64,
    fontWeight: FontWeight.w700,
    height: 0.97299999,
    color: Palette.hWhite,
  );

  // body Text Style
  static TextStyle mobileBody = GoogleFonts.archivo(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1,
    color: Palette.hWhite,
  );

  // listExtended Text Style
  static TextStyle listExtended = GoogleFonts.archivoBlack(
    fontSize: 64,
    fontWeight: FontWeight.w400,
    height: 1.0049999952,
    color: Palette.hWhite,
  );
  // anotationPad Text Style
  static const TextStyle anotationPad = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500, // medium
    height: 9.09,
    letterSpacing: 27,
    fontFamily: 'Syne',
  );
  // headingPad Text Style
  static const TextStyle headingPad = TextStyle(
    fontSize: 59.3325080871582,
    fontWeight: FontWeight.w700, // bold
    height: 1.45,
    letterSpacing: -5.5,
    fontFamily: 'Syne',
  );
  // listExtendedPad Text Style
  static const TextStyle listExtendedPad = TextStyle(
    fontSize: 29.6662540435791,
    fontWeight: FontWeight.w700, // bold
    height: 3.39,
    fontFamily: 'Syne',
  );
  // bodyPad Text Style
  static const TextStyle bodyPad = TextStyle(
    fontSize: 39.55500793457031,
    fontWeight: FontWeight.w600, // semiBold
    height: 1.5,
    fontFamily: 'Syne',
  );
  // anotationBold Text Style
  static TextStyle anotationBold = GoogleFonts.archivo(
    fontSize: 17.7980003357,
    fontWeight: FontWeight.w700,
    height: 1,
    letterSpacing: 4.8054600906,
    color: Palette.hWhite,
  );
  // anotationBody Text Style
  static TextStyle anotationBody = GoogleFonts.archivo(
    fontSize: 17.7980003357,
    fontWeight: FontWeight.w400,
    height: 1,
    color: Palette.hWhite,
  );
  // anotationBoldPad Text Style
  static const TextStyle anotationBoldPad = TextStyle(
    fontSize: 11.001235961914062,
    fontWeight: FontWeight.w700, // bold
    height: 9.09,
    letterSpacing: 27,
    fontFamily: 'Syne',
  );
  // anotationBodyPad Text Style
  static const TextStyle anotationBodyPad = TextStyle(
    fontSize: 11.001235961914062,
    fontWeight: FontWeight.w400, // regular
    height: 9.09,
    fontFamily: 'Syne',
  );
  // bodyMobile Text Style
  static const TextStyle bodyMobile = TextStyle(
    fontSize: 23.34000015258789,
    fontWeight: FontWeight.w600, // semiBold
    height: 1.5,
    fontFamily: 'Syne',
  );
  // listExtendedMobile Text Style
  static const TextStyle listExtendedMobile = TextStyle(
    fontSize: 18.337453842163086,
    fontWeight: FontWeight.w700, // bold
    height: 5.48,
    fontFamily: 'Syne',
  );
  // headingMobile Text Style
  static const TextStyle headingMobile = TextStyle(
    fontSize: 40.310001373291016,
    fontWeight: FontWeight.w700, // bold
    height: 2.25,
    letterSpacing: -5.5,
    fontFamily: 'Syne',
  );
  // projectList Text Style
  static const TextStyle projectList = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600, // semiBold
    height: 4.19,
    fontFamily: 'Syne',
  );
  // projectText Text Style
  static const TextStyle projectText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400, // regular
    height: 6.28,
    fontFamily: 'Syne',
  );
  // projectListMobile Text Style
  static const TextStyle projectListMobile = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600, // semiBold
    height: 8.37,
    fontFamily: 'Syne',
  );

  static TextStyle buttonTextStyle = GoogleFonts.syne(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1,
    color: Palette.hYellow,
  );

  static TextStyle listTileSubtextStyle = GoogleFonts.archivo(
      fontSize: 16, fontWeight: FontWeight.w500, color: Palette.bgBlack);
}
