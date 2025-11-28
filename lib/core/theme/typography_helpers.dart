/// Convert Figma line-height px -> Flutter TextStyle.height
double lh(double figmaLineHeight, double fontSize) {
  return fontSize == 0 ? 1.0 : figmaLineHeight / fontSize;
}

/// Convert Figma letterSpacing px -> Flutter letterSpacing (em)
double ls(double figmaLetterSpacing, double fontSize) {
  return fontSize == 0 ? 0.0 : figmaLetterSpacing / fontSize;
}
