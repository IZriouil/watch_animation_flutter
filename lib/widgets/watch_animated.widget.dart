import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:watch_animation_flutter/watch.model.dart';

import 'wood_3d_element.widget.dart';

class AnimatedWatch extends StatefulWidget {
  final AnimationController pillowController;
  final AnimationController boxController;
  final AnimationController topController;

  final Watch watch;
  final Color pillowColor;
  final Color boxColor;

  const AnimatedWatch(
      {super.key,
      required this.pillowController,
      required this.boxController,
      required this.topController,
      required this.watch,
      required this.pillowColor,
      required this.boxColor});

  @override
  State<AnimatedWatch> createState() => _AnimatedWatchState();
}

class _AnimatedWatchState extends State<AnimatedWatch> {
  late Animation _boxAnimation;
  late Animation _topAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

  void _initAnimations() {
    _boxAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: widget.boxController,
      curve: Curves.easeInOut,
    ));
    _topAnimation = Tween<Offset>(begin: Offset(60, -60), end: Offset(10, -10)).animate(CurvedAnimation(
      parent: widget.topController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    double faceSize = MediaQuery.of(context).size.width / 3;
    double depth = 10;

    return SizedBox(
        height: faceSize * 3,
        width: faceSize * 3,
        child: Stack(
          children: [
            ..._buildShadowComponents(faceSize, depth),
            ..._buildBoxComponents(faceSize, depth),
            _buildWatchComponent(faceSize, depth),
            _buildTopComponent(faceSize, depth),
          ],
        ));
  }

  Widget _buildWatchComponent(double faceSize, double depth) {
    return AnimatedBuilder(
        animation: _boxAnimation,
        builder: (context, child) {
          return Align(
            alignment: Alignment.center,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..scale((1 - 1.7) * _boxAnimation.value + 1.7, (1 - 1.7) * _boxAnimation.value + 1.7, 1),
              child: SizedBox(
                width: faceSize,
                height: faceSize,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedBuilder(
                        animation: widget.pillowController,
                        builder: (context, _) {
                          return Opacity(
                            opacity:
                                widget.pillowController.value < .5 ? widget.pillowController.value * 2 : 1,
                            child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.001)
                                ..scale(1.1),
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(widget.pillowColor, BlendMode.modulate),
                                child: Image.asset(
                                  "assets/images/pillow.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          );
                        }),
                    Hero(
                      transitionOnUserGestures: true,
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
    double maxPercentage = .958;
    return [
      AnimatedBuilder(
        animation: _boxAnimation,
        builder: (context, child) {
          double rotation =
              _boxAnimation.value < maxPercentage ? _boxAnimation.value * pi / 2 : maxPercentage * pi / 2;
          return Opacity(
              // opacity: 1,
              opacity: _boxAnimation.value < .5 ? _boxAnimation.value * 2 : 1,
              child: Align(
                alignment: Alignment.topCenter,
                child: Transform(
                  alignment: Alignment.bottomCenter,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(rotation),
                  child: Wood3DElement(
                    percentage: _boxAnimation.value,
                    size: faceSize,
                    depth: depth,
                  ),
                ),
              ));
        },
      ),
      AnimatedBuilder(
          animation: _boxAnimation,
          builder: (context, child) {
            double rotation =
                _boxAnimation.value < maxPercentage ? _boxAnimation.value * pi / 2 : maxPercentage * pi / 2;
            return Opacity(
                // opacity: 1,
                opacity: _boxAnimation.value < .5 ? _boxAnimation.value * 2 : 1,
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
                        percentage: _boxAnimation.value,
                        size: faceSize,
                        depth: depth,
                      ),
                    ),
                  ),
                ));
          }),
      AnimatedBuilder(
          animation: _boxAnimation,
          builder: (context, child) {
            double rotation =
                _boxAnimation.value < maxPercentage ? _boxAnimation.value * pi / 2 : maxPercentage * pi / 2;
            return Opacity(
                // opacity: 1,
                opacity: _boxAnimation.value < .5 ? _boxAnimation.value * 2 : 1,
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
                        percentage: _boxAnimation.value,
                        size: faceSize,
                        depth: depth,
                        boxShadowOffset: Offset(0, -10),
                      ),
                    ),
                  ),
                ));
          }),
      AnimatedBuilder(
          animation: _boxAnimation,
          builder: (context, child) {
            double rotation =
                _boxAnimation.value < maxPercentage ? _boxAnimation.value * pi / 2 : maxPercentage * pi / 2;
            return Opacity(
                // opacity: 1,
                opacity: _boxAnimation.value < .5 ? _boxAnimation.value * 2 : 1,
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
                        percentage: _boxAnimation.value,
                        size: faceSize,
                        depth: depth,
                        boxShadowOffset: Offset(-10, 0),
                      ),
                    ),
                  ),
                ));
          }),
      AnimatedBuilder(
          animation: _boxAnimation,
          builder: ((context, child) {
            return Align(
              child: Container(
                width: faceSize,
                height: faceSize,
                color: Colors.black.withOpacity(_boxAnimation.value),
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
            opacity: widget.topController.value < .2 ? widget.topController.value * 5 : 1,
            child: Align(
                alignment: Alignment.center,
                child: Transform(
                  alignment: Alignment.topRight,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..scale(1.2, 1.2)
                    ..translate(_topAnimation.value.dx, _topAnimation.value.dy, 0)
                    ..rotateY(-pi / 3 * (1 - widget.topController.value))
                    ..rotateX(-pi / 3 * (1 - widget.topController.value)),
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
                                  color: Colors.black.withOpacity(.5 * (1 - widget.topController.value)),
                                  colorBlendMode: BlendMode.overlay,
                                ),
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: widget.boxColor,
                                    backgroundBlendMode: BlendMode.color,
                                  ),
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
                                Center(
                                    child: RotatedBox(
                                        quarterTurns: 3,
                                        child: Container(
                                          margin: const EdgeInsets.all((30)),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              opacity: .35,
                                              image: AssetImage(
                                                "assets/images/steizy_logo.png",
                                              ),
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          // child: Image.asset(
                                          //   "assets/images/steizy.png",
                                          //   fit: BoxFit.contain,
                                          // ),
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
    double maxPercentage = .958;

    return [
      //SKEW RIGHT
      AnimatedBuilder(
          animation: _boxAnimation,
          builder: (context, child) {
            double percentage = _boxAnimation.value < maxPercentage ? _boxAnimation.value / maxPercentage : 1;
            return Opacity(
              opacity: percentage,
              child: Align(
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
              ),
            );
          }),
      AnimatedBuilder(
          animation: _boxAnimation,
          builder: (context, child) {
            double percentage = _boxAnimation.value < maxPercentage ? _boxAnimation.value / maxPercentage : 1;
            return Opacity(
              opacity: _boxAnimation.value < .5 ? _boxAnimation.value * 2 : 1,
              child: Align(
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
              ),
            );
          }),
      AnimatedBuilder(
          animation: _boxAnimation,
          builder: (context, child) {
            double percentage = _boxAnimation.value < maxPercentage ? _boxAnimation.value / maxPercentage : 1;
            return Opacity(
              opacity: _boxAnimation.value < .5 ? _boxAnimation.value * 2 : 1,
              child: Align(
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
              ),
            );
          }),
      AnimatedBuilder(
          animation: _boxAnimation,
          builder: (context, _) {
            double percentage = _boxAnimation.value / maxPercentage;

            return Opacity(
              opacity: _boxAnimation.value < .5 ? _boxAnimation.value * 2 : 1,
              child: Align(
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
              ),
            );
          }),
    ];
  }
}
