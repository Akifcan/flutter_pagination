import 'package:flutter/material.dart';

class PaginateButtonStyles {
  final double? fontSize;
  final BorderRadius? paginateButtonBorderRadius;
  final BorderRadius? prevButtonBorderRadius;
  final BorderRadius? nextButtonBorderRadius;
  final Color? backgroundColor;
  final Color? activeBackgroundColor;
  final TextStyle? textStyle;
  final TextStyle? activeTextStyle;

  PaginateButtonStyles(
      {this.fontSize,
      this.backgroundColor,
      this.activeBackgroundColor,
      this.paginateButtonBorderRadius,
      this.prevButtonBorderRadius,
      this.nextButtonBorderRadius,
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

  BorderRadius get getPrevButtonBorderRadius {
    return prevButtonBorderRadius ??
        const BorderRadius.only(
            topLeft: Radius.circular(20), bottomLeft: Radius.circular(20));
  }

  BorderRadius get getNextButtonBorderRadius {
    return nextButtonBorderRadius ??
        const BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20));
  }
}

class PaginateSkipButton extends PaginateButtonStyles {
  final Icon? icon;

  PaginateSkipButton({this.icon});
}
