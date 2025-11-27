import 'dart:ui';

import 'package:tepat/core/extensions/extensions.dart';

class TepatColors {
  // Primary
  static const p100 = Color(0xFF81ADE8);
  static const p200 = Color(0xFF4284DD);
  static const p300 = Color(0xFF205FB4);
  static const p400 = Color(0xFF153E75);
  static const p500 = Color(0xFF0C2545);
  static const p600 = Color(0xFF153E75);

  static Color get pAlpha => p600.o(0.1);

  // Secondary
  static const s100 = Color(0xFFBAF0DD);
  static const s200 = Color(0xFF74E1BB);
  static const s300 = Color(0xFF2FD299);
  static const s400 = Color(0xFF23A477);
  static const s500 = Color(0xFF197454);
  static const s600 = Color(0xFF2FD299);

  static Color get sAlpha => p600.o(0.1);

  // Neutral
  static const n100 = Color(0xFFFFFFFF);
  static const n200 = Color(0xFFE8E8E8);
  static const n300 = Color(0xFFD2D2D2);
  static const n400 = Color(0xFFBBBBBB);
  static const n500 = Color(0xFFA4A4A4);
  static const n600 = Color(0xFF8E8E8E);
  static const n700 = Color(0xFF777777);
  static const n800 = Color(0xFF606060);
  static const n900 = Color(0xFF4A4A4A);
  static const n1000 = Color(0xFF292929);
  static const n1100 = Color(0xFF191919);

  static Color get nAlpha => n1100.o(0.1);

  // Red
  static const r100 = Color(0xFFFB3748);
  static const r200 = Color(0xFFD00416);
  static const r300 = Color(0xFFE2BBBE);
  static const r400 = Color(0xFFFB3748);

  static Color get rAlpha => r400.o(0.1);

  // Yellow
  static const y100 = Color(0xFFFFDB43);
  static const y200 = Color(0xFFDFB400);
  static const y300 = Color(0xFFFFDB43);

  static Color get yAlpha => y300.o(0.1);

  // Green
  static const g100 = Color(0xFF84EBB4);
  static const g200 = Color(0xFF1FC16B);
  static const g300 = Color(0xFF1FC16B);

  static Color get gAlpha => g300.o(0.1);

  // Global
  static const gWhite = Color(0xFFFFFFFF);
  static const gBlack = Color(0xFF333333);
}
