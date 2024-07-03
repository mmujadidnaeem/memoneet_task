import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import 'base_button.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
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
      borderColor: AppColors.buttonColor,
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.buttonColor,
      size: size,
      child: child,
    );
  }
}
