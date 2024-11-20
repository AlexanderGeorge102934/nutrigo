import 'package:flutter/material.dart';
import 'custome_themes/bottom_sheet_theme.dart';
import 'custome_themes/chip_theme.dart';
import 'custome_themes/elevated_button_theme.dart';
import 'custome_themes/outlined_button_theme.dart';
import 'custome_themes/text_field_theme.dart';
import 'custome_themes/text_theme.dart';
class TAppTheme{
  TAppTheme._(); //Make constructor private Avoid creating instances

  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      //Puts in light mode
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.white,
      //Scaffold is treated as a different screen
      textTheme: TTextTheme.lightTextTheme(context),
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme(context),
      chipTheme: TChipTheme.lightChipTheme(context),
      bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme(context),
      inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme(context),
      outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme(context),
    );
  }
}