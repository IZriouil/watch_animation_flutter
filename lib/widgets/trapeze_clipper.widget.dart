import 'package:flutter/material.dart';

class TrapezoidClipper extends CustomClipper<Path> {
  final double depth;

  const TrapezoidClipper({this.depth = 10.0});
  @override
  Path getClip(Size size) {
    // Create a Path object that represents your custom shape
    var path = Path();
    //Add your custom shape to the path
    path.moveTo(0, 0);
    path.lineTo(depth, size.height);
    path.lineTo(size.width - depth, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
