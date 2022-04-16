import 'package:flutter/material.dart';

import 'button_styles.dart';

enum SkipButtonType { prev, next }

class SkipButton extends StatelessWidget {
  final PaginateSkipButton buttonStyles;
  final double height;
  final SkipButtonType skipButtonType;
  final VoidCallback onTap;
  const SkipButton(
      {Key? key,
      required this.buttonStyles,
      required this.height,
      required this.skipButtonType,
      required this.onTap})
      : super(key: key);

  final double radius = 20;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ClipRRect(
        borderRadius: buttonStyles.getBorderRadius,
        child: Material(
          color: Colors.blue,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: skipButtonType == SkipButtonType.prev
                  ? buttonStyles.icon ??
                      const Icon(Icons.chevron_left,
                          color: Colors.white, size: 35)
                  : buttonStyles.icon ??
                      const Icon(Icons.chevron_right,
                          color: Colors.white, size: 35),
            ),
          ),
        ),
      ),
    );
  }
}
