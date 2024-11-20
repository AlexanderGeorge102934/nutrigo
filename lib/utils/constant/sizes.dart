import 'package:flutter/cupertino.dart';

class TSizes {

  //Padding and margin sizes
  static double xs(BuildContext context) => MediaQuery.of(context).size.width * 0.01;
  static double sm(BuildContext context) => MediaQuery.of(context).size.width * 0.02;
  static double md(BuildContext context) => MediaQuery.of(context).size.width * 0.04;
  static double lg(BuildContext context) => MediaQuery.of(context).size.width * 0.06;
  static double xl(BuildContext context) => MediaQuery.of(context).size.width * 0.08;

  //Icon sizes
  static double iconXs(BuildContext context) => MediaQuery.of(context).size.width * 0.03;
  static double iconSm(BuildContext context) => MediaQuery.of(context).size.width * 0.04;
  static double iconMd(BuildContext context) => MediaQuery.of(context).size.width * 0.06;
  static double iconLg(BuildContext context) => MediaQuery.of(context).size.width * 0.08;

  //Font sizes
  static double fontSizeSm(BuildContext context) => MediaQuery.of(context).size.width * 0.035;
  static double fontSizeMd(BuildContext context) => MediaQuery.of(context).size.width * 0.04;
  static double fontSizeLg(BuildContext context) => MediaQuery.of(context).size.width * 0.045;
  static double fontSizeXl(BuildContext context) => MediaQuery.of(context).size.width * 0.05; //18
  static double fontSizeXXl(BuildContext context) => MediaQuery.of(context).size.width * 0.065; //24
  static double fontSizeXXXl(BuildContext context) => MediaQuery.of(context).size.width * 0.085; //32

  //Button sizes
  static double buttonHeight(BuildContext context) => MediaQuery.of(context).size.height * 0.05;
  static double buttonRadius(BuildContext context) => MediaQuery.of(context).size.width * 0.03;
  static double buttonWidth(BuildContext context) => MediaQuery.of(context).size.width * 0.4;
  static double buttonElevation(BuildContext context) => MediaQuery.of(context).size.height * 0.01;

  //Image sizes
  static const double imageThumbSize = 80.0;

  //Default spacing between sections
  static double defaultSpace(BuildContext context) => MediaQuery.of(context).size.height * 0.03;
  static double spaceBtwItems(BuildContext context) => MediaQuery.of(context).size.height * 0.01;
  static double spaceBtwSections(BuildContext context) => MediaQuery.of(context).size.height * 0.04;


  //Border radius
  static double borderRadiusSm(BuildContext context) => MediaQuery.of(context).size.width * 0.01;
  static double borderRadiusMd(BuildContext context) => MediaQuery.of(context).size.width * 0.02;
  static double borderRadiusLg(BuildContext context) => MediaQuery.of(context).size.width * 0.03;


  //divider height
  static double dividerHeight(BuildContext context) => MediaQuery.of(context).size.height * 0.001;

  //product item dimensions
  static const double productImageSize = 120.0;
  static const double productImageRadius = 16.0;
  static const double productItemHeight = 160.0;

  //Input field
  static const double inputFieldRadius = 12.0;
  static double spaceBtwInputFields(BuildContext context) => MediaQuery.of(context).size.height * 0.02;

  //Card sizes
  static double cardRadiusLg(BuildContext context) => MediaQuery.of(context).size.width * 0.04;
  static double cardRadiusMd(BuildContext context) => MediaQuery.of(context).size.width * 0.03;
  static double cardRadiusSm(BuildContext context) => MediaQuery.of(context).size.width * 0.025;
  static double cardRadiusXs(BuildContext context) => MediaQuery.of(context).size.width * 0.015;
  static double cardElevation(BuildContext context) => MediaQuery.of(context).size.height * 0.005;

  //loading
  static const double loadingIndicatorHeight = 200.0;

  //Grid view spacing
  static double gridViewSpacing(BuildContext context) => MediaQuery.of(context).size.height * 0.02;

  // AppBar height
  static double appBarHeight(BuildContext context) => MediaQuery.of(context).size.height * 0.07;

  //Border
  static double borderRadiusCircTextField(BuildContext context) => MediaQuery.of(context).size.width * 0.035;
  static double borderWidth(BuildContext context) => MediaQuery.of(context).size.width * 0.003;



}