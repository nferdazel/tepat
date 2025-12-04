import 'package:flutter/material.dart';
import 'package:tepat/core/theme/colors.dart';

enum TepatBase { blue, red }

enum TepatStyle { text, outlined }

enum TepatSize { sm, md, lg, xl, x2l } // x2l == 2xl

enum TepatMode { normal, hover, focussed, disabled }

class TepatButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final TepatBase base;
  final TepatStyle style;
  final TepatSize size;
  final TepatMode mode;
  final Widget? leadingIcon; // kalau ada icon + text
  final EdgeInsetsGeometry? paddingOverride;

  const TepatButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.base = TepatBase.blue,
    this.style = TepatStyle.text,
    this.size = TepatSize.md,
    this.mode = TepatMode.normal,
    this.leadingIcon,
    this.paddingOverride,
  });

  bool get _hasIcon => leadingIcon != null;

  // Height and minWidths sesuai spec Figma
  double get _height {
    switch (size) {
      case TepatSize.sm:
        return 36;
      case TepatSize.md:
        return 40;
      case TepatSize.lg:
        return 44;
      case TepatSize.xl:
        return 48;
      case TepatSize.x2l:
        return 60;
    }
  }

  double get _minWidth {
    // text-only -> 120 for all sizes
    if (!_hasIcon) return 120;
    // icon+text widths
    switch (size) {
      case TepatSize.sm:
      case TepatSize.md:
      case TepatSize.lg:
      case TepatSize.x2l:
        return 148;
      case TepatSize.xl:
        return 275;
    }
  }

  double get _iconSize {
    // icon size 24 for xl, else 20 (spec)
    return size == TepatSize.xl ? 24 : 20;
  }

  // Padding spec: horizontal 20, vertical 10 (unless override)
  EdgeInsets get _padding =>
      paddingOverride as EdgeInsets? ??
      const EdgeInsets.symmetric(horizontal: 20, vertical: 10);

  // compute colors according to mapping in the spec
  _ResolvedColors _resolveColors() {
    // Default fallbacks
    Color text = TepatColors.gWhite;
    Color bg = Colors.transparent;
    Color outline = Colors.transparent;
    Color icon = TepatColors.gWhite;

    if (base == TepatBase.blue) {
      if (style == TepatStyle.text) {
        // Blue-based text button
        switch (mode) {
          case TepatMode.normal:
          case TepatMode.focussed:
            text = TepatColors.gWhite;
            icon = TepatColors.gWhite;
            bg = TepatColors.p200;
            outline = Colors.transparent;
            break;
          case TepatMode.hover:
            text = TepatColors.gWhite;
            icon = TepatColors.gWhite;
            bg = TepatColors.p300;
            break;
          case TepatMode.disabled:
            text = TepatColors.gWhite;
            icon = TepatColors.gWhite;
            bg = TepatColors.n300;
            break;
        }
      } else {
        // Blue-based outlined button
        switch (mode) {
          case TepatMode.normal:
          case TepatMode.focussed:
            text = TepatColors.p200;
            icon = TepatColors.p200;
            outline = TepatColors.p200;
            bg = TepatColors.gWhite;
            break;
          case TepatMode.hover:
            text = TepatColors.p300;
            icon = TepatColors.p300;
            outline = TepatColors.p300;
            bg = TepatColors.gWhite;
            break;
          case TepatMode.disabled:
            text = TepatColors.n300;
            icon = TepatColors.n300;
            outline = TepatColors.n300;
            bg = TepatColors.gWhite;
            break;
        }
      }
    } else {
      // Red base
      if (style == TepatStyle.text) {
        // Red-based text button
        switch (mode) {
          case TepatMode.normal:
          case TepatMode.focussed:
            text = TepatColors.gWhite;
            icon = TepatColors.gWhite;
            bg = TepatColors.r100;
            break;
          case TepatMode.hover:
            text = TepatColors.gWhite;
            icon = TepatColors.gWhite;
            bg = TepatColors.r200;
            break;
          case TepatMode.disabled:
            text = TepatColors.r300;
            icon = TepatColors.r300;
            bg = TepatColors.rAlpha;
            break;
        }
        // Note: spec for disabled text of red-based textbutton said text r300 (and bg rAlpha)
      } else {
        // Red-based outlined
        switch (mode) {
          case TepatMode.normal:
          case TepatMode.focussed:
            text = TepatColors.r100;
            icon = TepatColors.r100;
            outline = TepatColors.r100;
            bg = TepatColors.gWhite;
            break;
          case TepatMode.hover:
            text = TepatColors.r200;
            icon = TepatColors.r200;
            outline = TepatColors.r200;
            bg = TepatColors.gWhite;
            break;
          case TepatMode.disabled:
            text = TepatColors.r300;
            icon = TepatColors.r300;
            outline = TepatColors.r300;
            bg = TepatColors.gWhite;
            break;
        }
      }
    }

    return _ResolvedColors(
      textColor: text,
      backgroundColor: bg,
      outlineColor: outline,
      iconColor: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    final resolved = _resolveColors();

    // If mode disabled, ensure non-interactive
    final effectiveOnPressed = mode == TepatMode.disabled ? null : onPressed;

    final childContent = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (_hasIcon) ...[
          IconTheme(
            data: IconThemeData(size: _iconSize, color: resolved.iconColor),
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SizedBox(
                height: _iconSize,
                width: _iconSize,
                child: FittedBox(child: leadingIcon),
              ),
            ),
          ),
        ],
        Flexible(
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: resolved.textColor,
              // font styling left to designer - use default
            ),
          ),
        ),
      ],
    );

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100),
      side: resolved.outlineColor == Colors.transparent
          ? BorderSide.none
          : BorderSide(color: resolved.outlineColor, width: 1.2),
    );

    final buttonChild = ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: _minWidth,
        minHeight: _height,
        maxHeight: _height,
      ),
      child: Padding(
        padding: EdgeInsets.zero, // padding handled inside buttons below
        child: Center(child: childContent),
      ),
    );

    // Choose widget type: outlined -> OutlinedButton; text -> ElevatedButton with custom bg
    if (style == TepatStyle.outlined) {
      return SizedBox(
        height: _height,
        child: OutlinedButton(
          onPressed: effectiveOnPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: resolved.backgroundColor,
            padding: _padding,
            shape: shape,
            minimumSize: Size(_minWidth, _height),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: buttonChild,
        ),
      );
    } else {
      // text-style but with colored bg (so using ElevatedButton with no elevation)
      return SizedBox(
        height: _height,
        child: ElevatedButton(
          onPressed: effectiveOnPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: resolved.backgroundColor,
            shape: shape,
            padding: _padding,
            minimumSize: Size(_minWidth, _height),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shadowColor: Colors.transparent,
          ),
          child: buttonChild,
        ),
      );
    }
  }
}

class _ResolvedColors {
  final Color textColor;
  final Color backgroundColor;
  final Color outlineColor;
  final Color iconColor;
  _ResolvedColors({
    required this.textColor,
    required this.backgroundColor,
    required this.outlineColor,
    required this.iconColor,
  });
}
