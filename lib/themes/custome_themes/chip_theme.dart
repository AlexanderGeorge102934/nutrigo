import 'package:flutter/material.dart';

class TChipTheme{
  TChipTheme._(); //Avoid creating instance

  /// Light Theme
  static ChipThemeData lightChipTheme (BuildContext context){
    return ChipThemeData(
        disabledColor: Colors.grey.withOpacity(0.4),
        labelStyle: const TextStyle(color: Colors.black),
        selectedColor: Colors.green,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.03,
            vertical: MediaQuery.of(context).size.height * 0.015),
        checkmarkColor: Colors.white
    );
  }
}