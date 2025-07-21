import 'package:flutter/material.dart';

class MediaQueryHelper {
  final BuildContext context;
  late double _width;
  late double _height;

  MediaQueryHelper(this.context) {
    final size = MediaQuery.of(context).size;
    _width = size.width;
    _height = size.height;
  }

  double get width => _width;
  double get height => _height;

  double font(double size) => _width * (size / 375);

  double padding(double value) => _width * (value / 375);
  double margin(double value) => _width * (value / 375);

  double radius(double value) => _width * (value / 375);

  double get smallSpacing => padding(8);
  double get mediumSpacing => padding(16);
  double get largeSpacing => padding(24);


  double imageHeight(double fraction) => _height * fraction;
  double imageWidth(double fraction) => _width * fraction;
}
