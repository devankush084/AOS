import 'package:flutter/material.dart';
import 'responsive.dart';

class AppSizes {

  static double splashImage(BuildContext context) =>
      Responsive.w(context, Responsive.isTablet(context) ? 220 : 140);

  static double topImage(BuildContext context) =>
      Responsive.h(context, Responsive.isTablet(context) ? 180 : 120);

  static double bottomImage(BuildContext context) =>
      Responsive.h(context, Responsive.isTablet(context) ? 200 : 140);
}