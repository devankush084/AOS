import 'package:flutter/material.dart';

extension TextStyleExtension on Text {
  Text regular({
    double size = 14,
    Color color = Colors.black,
  }) {
    return Text(
      data ?? '',
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Text medium({
    double size = 14,
    Color color = Colors.black,
  }) {
    return Text(
      data ?? '',
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Text semiBold({
    double size = 14,
    Color color = Colors.black,
  }) {
    return Text(
      data ?? '',
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Text bold({
    double size = 14,
    Color color = Colors.black,
  }) {
    return Text(
      data ?? '',
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

extension PaddingExtension on Widget {
  Widget paddingAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Widget paddingSymmetric({double vertical = 0, double horizontal = 0}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: vertical,
        horizontal: horizontal,
      ),
      child: this,
    );
  }

  Widget paddingOnly({
    double left = 0,
    double right = 0,
    double top = 0,
    double bottom = 0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        right: right,
        top: top,
        bottom: bottom,
      ),
      child: this,
    );
  }
}