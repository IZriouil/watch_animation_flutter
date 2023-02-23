import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:watch_animation_flutter/watch.model.dart';
import 'package:watch_animation_flutter/widgets/wood_3d_element.widget.dart';

import 'trapeze_painter.widget.dart';

class BoxFaceWidget extends StatefulWidget {
  final Watch watch;
  const BoxFaceWidget({super.key, required this.watch});

  @override
  State<BoxFaceWidget> createState() => _BoxFaceWidgetState();
}

class _BoxFaceWidgetState extends State<BoxFaceWidget> with TickerProviderStateMixin {
  late AnimationController _boxController;
  late AnimationController _topController;
  Tween<double> _boxTween = Tween<double>(begin: 0, end: 1);
  late Animation<Offset> _topAnimation;

  // double _sliderValue = 0;

  @override
  void initState() {
    super.initState();
    _boxController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _topController = AnimationController(vsync: this, duration: const Duration(seconds: 1));

    // tween init with controller
    _boxTween.animate(_boxController);
    _topAnimation = Tween<Offset>(begin: Offset(60, -60), end: Offset(20, -20)).animate(_topController);

    // when box controller is completed, start top controller
    _boxController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _topController.forward();
      }
    });

    // when top controller is completed, reset controllers with a 2 seconds delay
    _topController.addStatusListener((status) {
      // if (status == AnimationStatus.completed) {
      //   Future.delayed(const Duration(seconds: 2), () {
      //     _boxController.reset();
      //     _topController.reset();
      //   });
      // }
    });
  }

  @override
  void dispose() {
    _boxController.dispose();
    _topController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double faceSize = MediaQuery.of(context).size.width / 3;
    double depth = 10;
    // top translation related to depth
    double topTranslation = depth * 2;
    return SizedBox(
      width: faceSize * 3,
      height: faceSize * 3,
      child: Stack(
        children: [
          // _trash(faceSize, depth),
          ..._buildShadowComponents(faceSize, depth),
          // ..._buildBoxComponents(faceSize, depth),
          _buildWatchComponent(faceSize, depth),
          // _buildTopComponent(faceSize, depth),
          // _buildOverlayComponent(faceSize, depth),
        ],
      ),
    );
  }

  Center _trash(double faceSize, double depth) {
    return Center(
      child: Stack(
        children: [
          Transform(
            alignment: Alignment.topLeft,
            transform: Matrix4.skew(.2, 0),
            child: SizedBox(
              width: faceSize,
              height: faceSize,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  // color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 40,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ),
          ),
          Transform(
            alignment: Alignment.topCenter,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(-pi / 4),
            child: Wood3DElement(
              percentage: _boxController.value,
              size: faceSize,
              depth: depth,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWatchComponent(double faceSize, double depth) {
    return AnimatedBuilder(
        animation: _boxController,
        builder: (context, child) {
          return Align(
            alignment: Alignment.center,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..scale((1 - 1.7) * _boxController.value + 1.7, (1 - 1.7) * _boxController.value + 1.7, 1),
              child: SizedBox(
                width: faceSize,
                height: faceSize,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Hero(
                      tag: "${widget.watch.name}_image",
                      child: Image.asset(
                        widget.watch.assetImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _buildBoxComponents(double faceSize, double depth) {
    return [
      AnimatedBuilder(
        animation: _boxController,
        builder: (context, child) {
          double rotation = _boxController.value < .936 ? _boxController.value * pi / 2 : .936 * pi / 2;
          return Opacity(
              opacity: 1,
              // opacity: _boxController.value < .5 ? _boxController.value * 2 : 1,
              child: Align(
                alignment: Alignment.topCenter,
                child: Transform(
                  alignment: Alignment.bottomCenter,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(rotation),
                  child: Wood3DElement(
                    percentage: _boxController.value,
                    size: faceSize,
                    depth: depth,
                  ),
                ),
              ));
        },
      ),
      AnimatedBuilder(
          animation: _boxController,
          builder: (context, child) {
            double rotation = _boxController.value < .936 ? _boxController.value * pi / 2 : .936 * pi / 2;
            return Opacity(
                opacity: 1,
                // opacity: _boxController.value < .5 ? _boxController.value * 2 : 1,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Transform(
                    alignment: Alignment.centerRight,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(-rotation),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Wood3DElement(
                        percentage: _boxController.value,
                        size: faceSize,
                        depth: depth,
                      ),
                    ),
                  ),
                ));
          }),
      AnimatedBuilder(
          animation: _boxController,
          builder: (context, child) {
            double rotation = _boxController.value < .936 ? _boxController.value * pi / 2 : .936 * pi / 2;
            return Opacity(
                opacity: 1,
                // opacity: _boxController.value < .5 ? _boxController.value * 2 : 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Transform(
                    alignment: Alignment.centerLeft,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(rotation),
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Wood3DElement(
                        percentage: _boxController.value,
                        size: faceSize,
                        depth: depth,
                        boxShadowOffset: Offset(0, -10),
                      ),
                    ),
                  ),
                ));
          }),
      AnimatedBuilder(
          animation: _boxController,
          builder: (context, child) {
            double rotation = _boxController.value < .936 ? _boxController.value * pi / 2 : .936 * pi / 2;
            return Opacity(
                opacity: 1,
                // opacity: _boxController.value < .5 ? _boxController.value * 2 : 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Transform(
                    alignment: Alignment.topCenter,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateX(-rotation),
                    child: RotatedBox(
                      quarterTurns: 2,
                      child: Wood3DElement(
                        percentage: _boxController.value,
                        size: faceSize,
                        depth: depth,
                        boxShadowOffset: Offset(-10, 0),
                      ),
                    ),
                  ),
                ));
          }),
      AnimatedBuilder(
          animation: _boxController,
          builder: ((context, child) {
            return Align(
              child: Container(
                width: faceSize,
                height: faceSize,
                color: Colors.black.withOpacity(_boxController.value),
              ),
            );
          }))
    ];
  }

  _buildTopComponent(double faceSize, double depth) {
    return AnimatedBuilder(
        animation: _topAnimation,
        builder: (context, child) {
          return Opacity(
            opacity: _topController.value < .2 ? _topController.value * 5 : 1,
            child: Align(
                alignment: Alignment.center,
                child: Transform(
                  alignment: Alignment.topRight,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..scale(1.25, 1.25)
                    ..translate(_topAnimation.value.dx, _topAnimation.value.dy, 0)
                    ..rotateY(-pi / 3 * (1 - _topController.value))
                    ..rotateX(-pi / 3 * (1 - _topController.value)),
                  child: SizedBox(
                    width: faceSize,
                    height: faceSize,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            transformAlignment: Alignment.bottomCenter,
                            transform: Matrix4.identity()..rotateX(-pi / 2),
                            height: depth * 2,
                            width: faceSize,
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: Image.asset(
                                "assets/images/wood_vertical.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            transformAlignment: Alignment.centerLeft,
                            transform: Matrix4.identity()..rotateY(-pi / 2),
                            width: depth * 2,
                            height: faceSize,
                            color: Colors.red,
                            child: Image.asset(
                              "assets/images/wood_vertical.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                            transformAlignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001)
                              ..rotateZ(-3 * pi / 2),
                            // decoration: const BoxDecoration(
                            //   image: DecorationImage(
                            //     image: AssetImage(
                            //       "assets/images/wood_vertical.png",
                            //     ),
                            //     fit: BoxFit.contain,
                            //   ),
                            // ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                  "assets/images/wood_vertical.png",
                                  fit: BoxFit.contain,
                                  color: Colors.black.withOpacity(.5 * (1 - _topController.value)),
                                  colorBlendMode: BlendMode.overlay,
                                ),
                                DecoratedBox(
                                    decoration: BoxDecoration(
                                        gradient: RadialGradient(
                                          radius: .7,
                                          stops: const [.5, 1],
                                          colors: [
                                            Colors.black.withOpacity(0),
                                            Colors.black.withOpacity(.9),
                                          ],
                                        ),
                                        color: Colors.black.withOpacity(.5))),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      stops: [0, .035, .965, 1],
                                      colors: [
                                        Colors.black.withOpacity(.55),
                                        Colors.black.withOpacity(0),
                                        Colors.black.withOpacity(0),
                                        Colors.black.withOpacity(.55),
                                      ],
                                    ),
                                  ),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        stops: const [0, .035, .965, 1],
                                        colors: [
                                          Colors.black.withOpacity(.55),
                                          Colors.black.withOpacity(0),
                                          Colors.black.withOpacity(0),
                                          Colors.black.withOpacity(.55),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const Center(
                                    child: RotatedBox(
                                        quarterTurns: 3,
                                        child: Text(
                                          "ZRIOUIL",
                                        ))),
                              ],
                            )),
                      ],
                    ),
                  ),
                )),
          );
        });
  }

  _buildShadowComponents(double faceSize, double depth) {
    return [
      //SKEW RIGHT
      AnimatedBuilder(
          animation: _boxController,
          builder: (context, child) {
            double percentage = _boxController.value < .936 ? _boxController.value / .936 : 1;
            return Align(
              alignment: Alignment.centerRight,
              child: ClipRect(
                child: Container(
                  alignment: Alignment.center,
                  width: faceSize,
                  height: faceSize * 3,
                  child: Container(
                      width: faceSize,
                      height: faceSize,
                      transformAlignment: Alignment.bottomLeft,
                      transform: Matrix4.skew(0, percentage * .79),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: [.1, .9],
                          colors: [
                            Colors.black.withOpacity(.15),
                            Colors.black.withOpacity(0),
                          ],
                        ),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black.withOpacity(.1),
                        //     blurRadius: 15,
                        //     spreadRadius: 0,
                        //     offset: const Offset(0, 0),
                        //   ),
                        // ],
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          color: Colors.transparent,
                        ),
                      )),
                ),
              ),
            );
          }),
      AnimatedBuilder(
          animation: _boxController,
          builder: (context, child) {
            double percentage = _boxController.value < .936 ? _boxController.value / .936 : 1;
            return Align(
              alignment: Alignment.bottomCenter,
              child: ClipRect(
                child: Container(
                  alignment: Alignment.center,
                  width: faceSize * 3,
                  height: faceSize,
                  child: Container(
                      width: faceSize,
                      height: faceSize,
                      transformAlignment: Alignment.topRight,
                      transform: Matrix4.skew(percentage * .79, 0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [.2, .8],
                          colors: [
                            Colors.black.withOpacity(.15),
                            Colors.black.withOpacity(0),
                          ],
                        ),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black.withOpacity(.1),
                        //     blurRadius: 15,
                        //     spreadRadius: 3,
                        //     offset: const Offset(0, 0),
                        //   ),
                        // ],
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          color: Colors.transparent,
                        ),
                      )),
                ),
              ),
            );
          }),
      AnimatedBuilder(
          animation: _boxController,
          builder: (context, child) {
            double percentage = _boxController.value < .936 ? _boxController.value / .936 : 1;
            return Align(
              alignment: Alignment.centerLeft,
              child: ClipRect(
                child: Container(
                  alignment: Alignment.center,
                  height: faceSize * 3,
                  width: faceSize,
                  child: Container(
                    width: faceSize,
                    height: faceSize,
                    transformAlignment: Alignment.bottomRight,
                    transform: Matrix4.skew(0, -percentage * .78525),
                    child: SizedBox(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            stops: [0, 1 - percentage],
                            colors: [
                              Colors.black.withOpacity(.5),
                              Colors.black.withOpacity(0),
                            ],
                          ),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.black.withOpacity(.5),
                          //     blurRadius: 5,
                          //     spreadRadius: 10,
                          //     offset: const Offset(0, 0),
                          //   ),
                          // ],
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Container(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
      AnimatedBuilder(
          animation: _boxController,
          builder: (context, _) {
            double percentage = _boxController.value / .936;

            return Align(
              alignment: Alignment.topCenter,
              child: ClipRect(
                child: Container(
                  alignment: Alignment.center,
                  width: faceSize * 3,
                  height: faceSize,
                  child: Container(
                      width: faceSize,
                      height: faceSize,
                      transformAlignment: Alignment.bottomRight,
                      transform: Matrix4.skew(-percentage * .78525, .0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0, 1 - percentage],
                          colors: [
                            Colors.black.withOpacity(.5),
                            Colors.black.withOpacity(0),
                          ],
                        ),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black.withOpacity(.5),
                        //     blurRadius: 5,
                        //     spreadRadius: 10,
                        //     offset: const Offset(0, 0),
                        //   ),
                        // ],
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          color: Colors.transparent,
                        ),
                      )),
                ),
              ),
            );
          }),
      // SHADOW BOTTOM
      // Align(
      //   alignment: Alignment.bottomCenter,
      //   child: Container(
      //     width: faceSize,
      //     height: faceSize,
      //     transformAlignment: Alignment.topCenter,
      //     transform: Matrix4.identity()
      //       ..setEntry(3, 2, 0.001)
      //       ..scale(1.0, .6, 1.0),
      //     decoration: BoxDecoration(boxShadow: [
      //       BoxShadow(
      //         color: Colors.black.withOpacity(.2),
      //         blurRadius: 70,
      //         spreadRadius: 30,
      //         offset: const Offset(20, 10),
      //       ),
      //     ]),
      //   ),
      // ),
      // // SHADOW RIGHT
      // Align(
      //   alignment: Alignment.centerRight,
      //   child: Container(
      //     width: faceSize,
      //     height: faceSize,
      //     transformAlignment: Alignment.centerLeft,
      //     transform: Matrix4.identity()
      //       ..setEntry(3, 2, 0.001)
      //       ..scale(.6, 1.0, 1.0),
      //     decoration: BoxDecoration(boxShadow: [
      //       BoxShadow(
      //         color: Colors.black.withOpacity(.2),
      //         blurRadius: 70,
      //         spreadRadius: 30,
      //         offset: const Offset(10, 20),
      //       ),
      //     ]),
      //   ),
      // )
    ];
  }

  _buildOverlayComponent(double faceSize, double depth) {
    return AnimatedBuilder(
        animation: _topController,
        builder: (context, child) {
          double percentage = _topController.value;
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFDFDFDF).withOpacity(0),
                  Color(0xFFDFDFDF).withOpacity(percentage),
                ],
                stops: [.8, 1],
              ),
            ),
          );
        });
  }
}
