import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';

import 'dimens.dart';

class AppTextStyle {
  const AppTextStyle._();

  static final TextStyle textLightStyle =
      // GoogleFonts.inter(
      //     textStyle:
      TextStyle(
    color: Colors.white,
    fontSize: Dimens.fontSize14,
    fontWeight: FontWeight.w300,
    decoration: TextDecoration.none,
    // )
  );
  static final TextStyle textMainScreen =
      // GoogleFonts.inter(
      //     textStyle:
      TextStyle(
    color: Colors.white,
    fontSize: Dimens.fontSize14,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
    // )
  );
  static final TextStyle logoFont = GoogleFonts.bebasNeue(
      textStyle: TextStyle(
    color: Color(0xffFF97C9),
    fontSize: Dimens.fontSize14,
    letterSpacing: 2,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.none,
  ));
  static final TextStyle textNormalStyle =
      // GoogleFonts.inter(
      //     textStyle:
      GoogleFonts.inter(
          textStyle: TextStyle(
    color: Colors.white,
    fontSize: Dimens.fontSize14,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
  ));

  static final TextStyle textTitleStyle =
      // GoogleFonts.inter(
      //     textStyle:
      GoogleFonts.inter(
          textStyle: TextStyle(
    color: Colors.white,
    fontSize: Dimens.fontSize18,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
  ));

  static final TextStyle textMediumStyle = GoogleFonts.inter(
      textStyle: TextStyle(
    color: Colors.white,
    fontSize: Dimens.fontSize14,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
  ));
  static final TextStyle textSemiBoldStyle = GoogleFonts.inter(
      textStyle: TextStyle(
    color: Colors.white,
    fontSize: Dimens.fontSize18,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
  ));

  static final TextStyle textBoldStyle = GoogleFonts.inter(
      textStyle: TextStyle(
    color: Colors.white,
    fontSize: Dimens.fontSize14,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.none,
  ));
  static final TextStyle textRoboto = GoogleFonts.bebasNeue(
      textStyle: TextStyle(
    color: Colors.white,
    fontSize: 150,
    fontWeight: FontWeight.w400,
    height: 0.9,
    decoration: TextDecoration.none,
  ));
}
