import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTexts {
  static heading1({required String text}) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w800,
        letterSpacing: 1,
        color: AppColors.primaryColor,
      ),
    );
  }

  static heading2({required String text}) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
        color: AppColors.primaryColor,
      ),
    );
  }

  static heading3({required String text}) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
        color: AppColors.primaryColor,
      ),
    );
  }

  static heading4({required String text}) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
        color: AppColors.primaryColor,
      ),
    );
  }

  static heading5({required String text}) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
        color: AppColors.primaryColor,
      ),
    );
  }

  static heading6({required String text}) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
        color: AppColors.primaryColor,
      ),
    );
  }
}
