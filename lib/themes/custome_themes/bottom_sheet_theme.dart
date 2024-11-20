import 'package:flutter/material.dart';

import '../../utils/constant/sizes.dart';




class TBottomSheetTheme{
  TBottomSheetTheme._(); //Avoid creating instanes

  /// Light Theme
  static BottomSheetThemeData lightBottomSheetTheme(BuildContext context) {
    return BottomSheetThemeData(
      showDragHandle: true,
      backgroundColor: Colors.white,
      modalBackgroundColor: Colors.white,
      constraints: const BoxConstraints(minWidth: double.infinity),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.borderRadiusCircTextField(context)+0.005)),
    );
  }

}