import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, desktop }

class Responsive {

  /// 🔥 DEVICE TYPE
  static DeviceType getDeviceType(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width >= 1024) return DeviceType.desktop;
    if (width >= 600) return DeviceType.tablet;
    return DeviceType.mobile;
  }

  /// 🔥 BASE WIDTH (DESIGN WIDTH)
  static const double baseWidth = 375;

  /// 🔥 SCALE FACTOR
  static double scale(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return width / baseWidth;
  }

  /// 🔥 WIDTH BASED SCALING
  static double w(BuildContext context, double size) {
    return size * scale(context);
  }

  /// 🔥 HEIGHT BASED (SAFE)
  static double h(BuildContext context, double size) {
    return size * scale(context);
  }

  /// 🔥 FONT SCALING
  static double sp(BuildContext context, double size) {
    return size * scale(context);
  }

  /// 🔥 DEVICE CHECKS
  static bool isTablet(BuildContext context) =>
      getDeviceType(context) == DeviceType.tablet;

  static bool isMobile(BuildContext context) =>
      getDeviceType(context) == DeviceType.mobile;
}