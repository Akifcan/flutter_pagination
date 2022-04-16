import 'package:flutter/material.dart';

import 'button_styles.dart';

class PaginateButton extends StatelessWidget {
  final bool active;
  final double height;
  final double? width;
  final int page;
  final Color color;
  final Function(int number) onTap;
  final PaginateButtonStyles buttonStyles;
  const PaginateButton(
      {Key? key,
      required this.active,
      this.width,
      required this.buttonStyles,
      required this.page,
      required this.height,
      required this.color,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: buttonStyles.getPaginateButtonBorderRadius,
      child: SizedBox(
        height: height,
        width: width ?? MediaQuery.of(context).size.width,
        child: Material(
          color: active
              ? buttonStyles.getActiveBackgroundColor
              : buttonStyles.getBackgroundColor,
          child: InkWell(
            onTap: () {
              onTap(page);
            },
            child: Center(
              child: Text("$page",
                  style: active
                      ? buttonStyles.getActiveTextStyle
                      : buttonStyles.getTextStyle,
                  textAlign: TextAlign.center),
            ),
          ),
        ),
      ),
    );
  }
}
