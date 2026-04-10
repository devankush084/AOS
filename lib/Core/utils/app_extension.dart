import 'package:flutter/material.dart';

/// =======================
/// TEXT EXTENSION
/// =======================
extension TextStyleExtension on Text {
  Text _applyStyle({
    double? size,
    Color? color,
    FontWeight? weight,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    String? fontFamily,
    double? letterSpacing,
  }) {
    return Text(
      data ?? '',
      key: key,
      textAlign: textAlign ?? this.textAlign,
      maxLines: maxLines ?? this.maxLines,
      overflow: overflow ?? this.overflow,
      style: (style ?? const TextStyle()).copyWith(
        fontSize: size,
        color: color,
        fontWeight: weight,
        height: height,
        decoration: decoration,
        fontStyle: fontStyle,
        fontFamily: fontFamily,
        letterSpacing: letterSpacing,
      ),
    );
  }

  Text regular({
    double? size,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? height,
    double? letterSpacing,
  }) {
    return _applyStyle(
      size: size,
      color: color,
      weight: FontWeight.w400,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  Text medium({
    double? size,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? height,
    double? letterSpacing,
  }) {
    return _applyStyle(
      size: size,
      color: color,
      weight: FontWeight.w500,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  Text semiBold({
    double? size,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? height,
    double? letterSpacing,
  }) {
    return _applyStyle(
      size: size,
      color: color,
      weight: FontWeight.w600,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  Text bold({
    double? size,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? height,
    double? letterSpacing,
  }) {
    return _applyStyle(
      size: size,
      color: color,
      weight: FontWeight.w700,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      height: height,
      letterSpacing: letterSpacing,
    );
  }
}

/// =======================
/// PADDING EXTENSION
/// =======================
extension PaddingExtension on Widget {
  Widget paddingAll(double value) => Padding(
    padding: EdgeInsets.all(value),
    child: this,
  );

  Widget paddingSymmetric({
    double horizontal = 0,
    double vertical = 0,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: this,
      );

  Widget paddingOnly({
    double left = 0,
    double right = 0,
    double top = 0,
    double bottom = 0,
  }) =>
      Padding(
        padding: EdgeInsets.only(
          left: left,
          right: right,
          top: top,
          bottom: bottom,
        ),
        child: this,
      );

  Widget paddingHorizontal(double value) => Padding(
    padding: EdgeInsets.symmetric(horizontal: value),
    child: this,
  );

  Widget paddingVertical(double value) => Padding(
    padding: EdgeInsets.symmetric(vertical: value),
    child: this,
  );
}