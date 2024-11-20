import 'package:flutter/material.dart';

import '../../utils/constant/sizes.dart';


class TTextTheme{
  TTextTheme._(); //Private constructor Avoid creating instances
  static TextTheme lightTextTheme(BuildContext context) {
    return TextTheme(
      headlineLarge: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeXXXl(context), fontWeight: FontWeight.bold, color: Colors.black),
      headlineMedium: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeXXl(context), fontWeight: FontWeight.w600, color: Colors.black),
      headlineSmall: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeXl(context), fontWeight: FontWeight.w600, color: Colors.black),

      titleLarge: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeLg(context), fontWeight: FontWeight.w600, color: Colors.black),
      titleMedium: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeLg(context), fontWeight: FontWeight.w500, color: Colors.black),
      titleSmall: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeLg(context), fontWeight: FontWeight.w400, color: Colors.black),

      bodyLarge: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeLg(context), fontWeight: FontWeight.w500, color: Colors.black),
      bodyMedium: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeLg(context), fontWeight: FontWeight.normal, color: Colors.black),
      bodySmall: const TextStyle().copyWith(fontSize: TSizes.fontSizeLg(context),
          fontWeight: FontWeight.w500,
          color: Colors.black.withOpacity(0.5)),

      labelLarge: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeLg(context), fontWeight: FontWeight.normal, color: Colors.black),
      labelMedium: const TextStyle().copyWith(fontSize: TSizes.fontSizeLg(context),
          fontWeight: FontWeight.normal,
          color: Colors.black.withOpacity(0.5)),
    );
  }


}