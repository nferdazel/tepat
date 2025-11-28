import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tepat/core/theme/colors.dart';
import 'package:tepat/core/theme/typography_helpers.dart';

class TepatTextStyles {
  // Core builder: uses bundled fontFamily 'Inter' (see pubspec snippet)
  static TextStyle _inter({
    required double fontSize,
    required double lineHeightPx,
    required double letterSpacingPx,
    required FontWeight fontWeight,
    Color? color,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: lh(lineHeightPx, fontSize),
      letterSpacing: ls(letterSpacingPx, fontSize),
      color: color,
    );
  }

  // HEADINGS (expose as function so color override is simple)
  static TextStyle h1([Color? color]) => _inter(
    fontSize: 68,
    lineHeightPx: 102,
    letterSpacingPx: 0,
    fontWeight: FontWeight.w700,
    color: color ?? TepatColors.gBlack,
  );

  static TextStyle h2([Color? color]) => _inter(
    fontSize: 56,
    lineHeightPx: 84,
    letterSpacingPx: 0,
    fontWeight: FontWeight.w700,
    color: color ?? TepatColors.gBlack,
  );

  static TextStyle h3([Color? color]) => _inter(
    fontSize: 46,
    lineHeightPx: 69,
    letterSpacingPx: 0,
    fontWeight: FontWeight.w700,
    color: color ?? TepatColors.gBlack,
  );

  static TextStyle h4([Color? color]) => _inter(
    fontSize: 38,
    lineHeightPx: 57,
    letterSpacingPx: 0,
    fontWeight: FontWeight.w700,
    color: color ?? TepatColors.gBlack,
  );

  static TextStyle h5([Color? color]) => _inter(
    fontSize: 32,
    lineHeightPx: 48,
    letterSpacingPx: 0,
    fontWeight: FontWeight.w700,
    color: color ?? TepatColors.gBlack,
  );

  static TextStyle h6([Color? color]) => _inter(
    fontSize: 26,
    lineHeightPx: 39,
    letterSpacingPx: 0,
    fontWeight: FontWeight.w700,
    color: color ?? TepatColors.gBlack,
  );

  static TextStyle h7([Color? color]) => _inter(
    fontSize: 22,
    lineHeightPx: 33,
    letterSpacingPx: 0,
    fontWeight: FontWeight.w700,
    color: color ?? TepatColors.gBlack,
  );

  // BODY / COPY
  // boolean `medium` toggles weight 500 vs 400
  static TextStyle b1({Color? color, bool medium = false}) => _inter(
    fontSize: 18,
    lineHeightPx: 27,
    letterSpacingPx: 0,
    fontWeight: medium ? FontWeight.w500 : FontWeight.w400,
    color: color ?? TepatColors.gBlack,
  );

  static TextStyle b2({Color? color, bool medium = false}) => _inter(
    fontSize: 16,
    lineHeightPx: 24,
    letterSpacingPx: 0,
    fontWeight: medium ? FontWeight.w500 : FontWeight.w400,
    color: color ?? TepatColors.gBlack,
  );

  static TextStyle b3({Color? color, bool medium = false}) => _inter(
    fontSize: 14,
    lineHeightPx: 18,
    letterSpacingPx: 0,
    fontWeight: medium ? FontWeight.w500 : FontWeight.w400,
    color: color ?? TepatColors.gBlack,
  );

  static TextStyle b4({Color? color, bool medium = false}) => _inter(
    fontSize: 12,
    lineHeightPx: 18,
    letterSpacingPx: 0,
    fontWeight: medium ? FontWeight.w500 : FontWeight.w400,
    color: color ?? TepatColors.gBlack,
  );

  static TextStyle b5({Color? color, bool medium = false}) => _inter(
    fontSize: 10,
    lineHeightPx: 15,
    letterSpacingPx: 0,
    fontWeight: medium ? FontWeight.w500 : FontWeight.w400,
    color: color ?? TepatColors.gBlack,
  );
}
