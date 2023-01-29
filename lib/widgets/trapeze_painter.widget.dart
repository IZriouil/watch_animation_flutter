import 'package:flutter/material.dart';

class TrapezoidPainter extends CustomPainter {
  final double depth;

  const TrapezoidPainter({this.depth = 10.0});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(depth, size.height);
    path.lineTo(size.width - depth, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
