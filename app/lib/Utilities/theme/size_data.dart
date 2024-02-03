import 'package:flutter/material.dart';

class CustomSizeData {
  final double height;
  final double width;
  final double aspectRatio;

  final double superHeader;
  final double header;
  final double subHeader;
  final double medium;
  final double regular;
  final double small;
  final double verySmall;
  final double tooSmall;

  // Color Data

  factory CustomSizeData.from(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;

    double superHeader = aspectRatio * 55;
    double header = aspectRatio * 45;
    double subHeader = aspectRatio * 40;
    double medium = aspectRatio * 35;
    double regular = aspectRatio * 30;
    double small = aspectRatio * 28;
    double verySmall = aspectRatio * 26;
    double tooSmall = aspectRatio * 24;

    return CustomSizeData(
        height: height,
        width: width,
        aspectRatio: aspectRatio,
        superHeader: superHeader,
        header: header,
        medium: medium,
        regular: regular,
        small: small,
        subHeader: subHeader,
        verySmall: verySmall,
        tooSmall: tooSmall);
  }

  CustomSizeData({
    required this.height,
    required this.width,
    required this.aspectRatio,
    required this.superHeader,
    required this.header,
    required this.subHeader,
    required this.medium,
    required this.regular,
    required this.small,
    required this.verySmall,
    required this.tooSmall,
  });
}
