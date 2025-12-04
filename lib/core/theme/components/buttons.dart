import 'package:flutter/material.dart';
import 'package:tepat/core/theme/colors.dart';

enum TepatBase { blue, red }

enum TepatKind { filled, outlined }

enum TepatSize { sm, md, lg, xl, x2l }

class TepatButtonStyles {
  static ButtonStyle style({
    required TepatBase base,
    required TepatKind kind,
    required TepatSize size,
    required bool hasIcon,
  }) {
    final double height = _heightFor(size);
    final double minWidth = _minWidthFor(size, hasIcon: hasIcon);
    final padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10);

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100),
    );

    final backgroundColor = WidgetStateProperty.resolveWith<Color?>((states) {
      if (kind == TepatKind.outlined) return TepatColors.gWhite;

      if (states.contains(WidgetState.disabled)) {
        return base == TepatBase.blue ? TepatColors.n300 : TepatColors.rAlpha;
      }
      if (states.contains(WidgetState.hovered)) {
        return base == TepatBase.blue ? TepatColors.p300 : TepatColors.r200;
      }
      if (states.contains(WidgetState.focused)) {
        return base == TepatBase.blue ? TepatColors.p200 : TepatColors.r100;
      }
      return base == TepatBase.blue ? TepatColors.p200 : TepatColors.r100;
    });

    final foregroundColor = WidgetStateProperty.resolveWith<Color?>((states) {
      if (kind == TepatKind.outlined) {
        if (states.contains(WidgetState.disabled)) return TepatColors.n300;
        if (states.contains(WidgetState.hovered)) {
          return base == TepatBase.blue ? TepatColors.p300 : TepatColors.r200;
        }
        return base == TepatBase.blue ? TepatColors.p200 : TepatColors.r100;
      }

      if (states.contains(WidgetState.disabled)) {
        return base == TepatBase.blue ? TepatColors.gWhite : TepatColors.r300;
      }
      return TepatColors.gWhite;
    });

    final side = WidgetStateProperty.resolveWith<BorderSide?>((states) {
      if (kind == TepatKind.outlined) {
        if (states.contains(WidgetState.disabled)) {
          return BorderSide(color: TepatColors.n300, width: 1.0);
        }
        if (states.contains(WidgetState.hovered)) {
          return BorderSide(
            color: base == TepatBase.blue ? TepatColors.p300 : TepatColors.r200,
            width: 1.0,
          );
        }
        return BorderSide(
          color: base == TepatBase.blue ? TepatColors.p200 : TepatColors.r100,
          width: 1.0,
        );
      }
      return null;
    });

    final overlayColor = WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.pressed)) {
        return Colors.black.withValues(alpha: 0.06);
      }
      if (states.contains(WidgetState.hovered)) {
        return Colors.black.withValues(alpha: 0.02);
      }
      return null;
    });

    return ButtonStyle(
      minimumSize: WidgetStateProperty.all(Size(minWidth, height)),
      padding: WidgetStateProperty.all(padding),
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      overlayColor: overlayColor,
      side: side,
      shape: WidgetStateProperty.all(shape),
      elevation: WidgetStateProperty.all(0),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  static double _heightFor(TepatSize s) {
    switch (s) {
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

  static double _minWidthFor(TepatSize s, {required bool hasIcon}) {
    if (!hasIcon) return 120;
    return s == TepatSize.xl ? 275 : 148;
  }
}

class TepatButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final TepatBase base;
  final TepatKind kind;
  final TepatSize size;
  final Widget? leadingIcon;

  const TepatButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.base = TepatBase.blue,
    this.kind = TepatKind.filled,
    this.size = TepatSize.md,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    final hasIcon = leadingIcon != null;
    final style = TepatButtonStyles.style(
      base: base,
      kind: kind,
      size: size,
      hasIcon: hasIcon,
    );

    final iconSize = size == TepatSize.xl ? 24.0 : 20.0;

    final child = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hasIcon)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconTheme(
              data: IconThemeData(size: iconSize),
              child: leadingIcon!,
            ),
          ),
        Flexible(child: Text(label, overflow: TextOverflow.ellipsis)),
      ],
    );

    if (kind == TepatKind.outlined) {
      return OutlinedButton(onPressed: onPressed, style: style, child: child);
    } else {
      return ElevatedButton(onPressed: onPressed, style: style, child: child);
    }
  }
}
