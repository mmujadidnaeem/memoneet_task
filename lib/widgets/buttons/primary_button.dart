import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import 'base_button.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.size,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onPressed: onPressed,
      backgroundColor: AppColors.buttonColor,
      disabledBackgroundColor: AppColors.buttonColor.withOpacity(0.5),
      foregroundColor: AppColors.btnTextColor,
      size: size,
      child: child,
    );
  }
}
