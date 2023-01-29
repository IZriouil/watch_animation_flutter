import 'dart:math';

import 'package:flutter/material.dart';
import 'package:watch_animation_flutter/widgets/trapeze_clipper.widget.dart';
import 'package:watch_animation_flutter/widgets/trapeze_painter.widget.dart';

class Wood3DElement extends StatelessWidget {
  final double depth;
  final double size;
  final String position;
  final double percentage;
  final Offset? boxShadowOffset;
  const Wood3DElement(
      {super.key,
      this.depth = 5,
      this.size = 150,
      this.position = "top",
      this.percentage = 0,
      this.boxShadowOffset});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        children: [
          if (boxShadowOffset != null)
            Container(
              transformAlignment: Alignment.bottomCenter,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..translate(0.0, 0.0, -depth)
                ..rotateX(-pi / 12),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.35),
                      blurRadius: 40,
                      spreadRadius: 10,
                      offset: boxShadowOffset!)
                ],
              ),
            ),
          _buildBackFace(depth, size),
          ..._buildEdges(depth, size),
          _buildFrontFace(depth, size),
        ],
      ),
    );
  }

  Transform _buildFrontFace(double depth, double size) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..translate(0.0, 0.0, -depth),
      child: Container(
        height: size,
        width: size,
        color: Colors.transparent,
        padding: EdgeInsets.all(depth),
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/wood_vertical.png"),
                    colorFilter:
                        ColorFilter.mode(Colors.black.withOpacity(0.7 * percentage), BlendMode.darken),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(depth / 3),
                color: Colors.grey),
            child: const Center(child: Text(""))),
      ),
    );
  }

  Container _buildBackFace(double depth, double size) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/wood_vertical.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.9 * percentage), BlendMode.darken)),
        borderRadius: BorderRadius.circular(depth / 3),
      ),
      child: const Center(child: Text("Back Face")),
    );
  }

  List<Widget> _buildEdges(double depth, double size) {
    return [
      Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(-pi / 4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(depth / 3),
          child: _trapShape(size, depth, darken: false),
        ),
      ),
      Transform(
        alignment: Alignment.topCenter,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..translate(0.0, size)
          ..rotateX(-pi + pi / 4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(depth / 3),
          child: _trapShape(size, depth),
        ),
      ),
      // left
      Transform(
        alignment: Alignment.topCenter,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..translate(-size / 2, size / 2)
          ..rotateZ(pi / 2)
          ..rotateX(-pi + pi / 4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(depth / 3),
          child: _trapShape(size, depth),
        ),
      ),
      // right
      Transform(
        alignment: Alignment.topCenter,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..translate(size / 2, size / 2)
          ..rotateZ(-pi / 2)
          ..rotateX(-pi + pi / 4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(depth / 3),
          child: _trapShape(size, depth),
        ),
      ),
      // TOP
      // // RIGHT
      // Transform(
      //   transform: Matrix4.identity()
      //     ..setEntry(3, 2, 0.001)
      //     ..rotateX(-pi / 4),
      //   child: SizedBox(
      //     width: size,
      //     height: depth * sqrt2,
      //     child: CustomPaint(
      //       painter: TrapezoidPainter(depth: depth),
      //     ),
      //   ),
      // ),
      // // Bottom
      // Transform(
      //   transform: Matrix4.identity()
      //     ..setEntry(3, 2, 0.001)
      //     ..rotateX(-pi / 4),
      //   child: SizedBox(
      //     width: size,
      //     height: depth * sqrt2,
      //     child: CustomPaint(
      //       painter: TrapezoidPainter(depth: depth),
      //     ),
      //   ),
      // ),
    ];
  }

  SizedBox _trapShape(double size, double depth, {bool darken = true}) {
    return SizedBox(
      width: size,
      height: depth * sqrt2,
      child: ClipPath(
        clipper: TrapezoidClipper(depth: depth),
        child: RotatedBox(
            quarterTurns: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/wood_vertical.png"),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(darken ? 0.9 * percentage : 0), BlendMode.darken)),
                  borderRadius: BorderRadius.circular(depth / 3),
                  color: Colors.grey),
            )),
      ),
    );
  }
}
