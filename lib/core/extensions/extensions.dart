import 'package:flutter/material.dart';
import 'package:tepat/core/theme/tokens.dart';

extension TepatFit on num {
  double w(BuildContext c) {
    final width = MediaQuery.of(c).size.width;
    return this * (width / TepatTokens.figmaWidth);
  }

  double h(BuildContext c) {
    final height = MediaQuery.of(c).size.height;
    return this * (height / TepatTokens.figmaHeight);
  }
}

extension TepatOpacity on Color {
  Color o(double opacity) {
    return withAlpha((opacity * 255).round());
  }
}
