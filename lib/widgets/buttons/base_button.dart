import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    super.key,
    required this.child,
    required this.onPressed,
    required this.backgroundColor,
    this.foregroundColor = AppColors.backgroundColor,
    this.size,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.borderColor = Colors.transparent,
    this.borderWidth = 1,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color? disabledBackgroundColor;
  final Color foregroundColor;
  final Color? disabledForegroundColor;
  final Color borderColor;
  final double borderWidth;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        elevation: 0.0,
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 10.0,
        ),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor,
            width: borderColor == Colors.transparent ? 0 : borderWidth,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        textStyle: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: size ?? Size.zero,
        disabledBackgroundColor: disabledBackgroundColor,
        disabledForegroundColor: disabledForegroundColor,
      ),
      child: child,
    );
  }
}
