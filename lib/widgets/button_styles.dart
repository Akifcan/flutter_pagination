import 'package:flutter/material.dart';

class PaginateButtonStyles {
  final double? fontSize;
  final BorderRadius? paginateButtonBorderRadius;
  final Color? backgroundColor;
  final Color? activeBackgroundColor;
  final TextStyle? textStyle;
  final TextStyle? activeTextStyle;

  PaginateButtonStyles(
      {this.fontSize,
      this.backgroundColor,
      this.activeBackgroundColor,
      this.paginateButtonBorderRadius,
      this.textStyle,
      this.activeTextStyle});

  double get getFontSize {
    return fontSize ?? 14.0;
  }

  Color get getBackgroundColor {
    return backgroundColor ?? Colors.blue;
  }

  Color get getActiveBackgroundColor {
    return activeBackgroundColor ?? Colors.blueGrey;
  }

  TextStyle get getTextStyle {
    return textStyle ??
        const TextStyle(
            color: Colors.white, fontFamily: 'Roboto', fontSize: 14);
  }

  TextStyle get getActiveTextStyle {
    return activeTextStyle ??
        const TextStyle(
            color: Colors.white, fontFamily: 'Roboto', fontSize: 14);
  }

  BorderRadius get getPaginateButtonBorderRadius {
    return paginateButtonBorderRadius ?? BorderRadius.circular(0);
  }
}

class PaginateSkipButton extends PaginateButtonStyles {
  final Icon? icon;
  final BorderRadius? borderRadius;

  PaginateSkipButton({this.icon, this.borderRadius});

  BorderRadius get getBorderRadius {
    return borderRadius ?? BorderRadius.zero;
  }
}
