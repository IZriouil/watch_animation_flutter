import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:watch_animation_flutter/config/constants.dart';
import 'package:watch_animation_flutter/watch.model.dart';
import 'package:watch_animation_flutter/widgets/app_bar.widget.dart';
import 'package:watch_animation_flutter/widgets/box_face.widget.dart';
import 'package:watch_animation_flutter/widgets/box_step.widget.dart';
import 'package:watch_animation_flutter/widgets/checkout_step.widget.dart';
import 'package:watch_animation_flutter/widgets/info_step.widget.dart';
import 'package:watch_animation_flutter/widgets/pillow_step.widget.dart';
import 'package:watch_animation_flutter/widgets/watch_animated.widget.dart';

class WatchPage extends StatefulWidget {
  final Watch watch;
  const WatchPage({super.key, required this.watch});

  @override
  State<WatchPage> createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> with TickerProviderStateMixin {
  late AnimationController _pillowController;
  late AnimationController _boxController;
  late AnimationController _topController;
  late AnimationController _checkoutController;

  late Animation _pillowAnimation;
  late Animation _checkoutAnimation;

  int _stepCheckout = 0;
  Color _pillowColor = kPillowColors[1];
  Color _boxColor = kBoxColors[0];

  @override
  void initState() {
    super.initState();
    _initControllers();
    _pillowAnimation = Tween(begin: 1.7, end: 1.5).animate(CurvedAnimation(
      parent: _pillowController,
      curve: Curves.elasticOut,
    ));
    _checkoutAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(-60, -40)).animate(CurvedAnimation(
      parent: _checkoutController,
      curve: Curves.elasticOut,
    ));
  }

  @override
  void dispose() {
    _pillowController.dispose();
    _boxController.dispose();
    _topController.dispose();
    _checkoutController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: const Color(0xFFF6F6F6),
        appBar: const WatchAppBarWidget(),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    child: Container(
                  // color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Stack(
                      children: [
                        AnimatedBuilder(
                            animation: Listenable.merge([_pillowAnimation, _checkoutAnimation]),
                            builder: (context, _) {
                              return Transform.scale(
                                  alignment: Alignment.topCenter,
                                  // scale: 1.7,
                                  scale: _pillowAnimation.value + _checkoutController.value * .6,
                                  child: Transform.translate(
                                    offset: _checkoutAnimation.value,
                                    child: AnimatedWatch(
                                        boxController: _boxController,
                                        pillowController: _pillowController,
                                        topController: _topController,
                                        boxColor: _boxColor,
                                        pillowColor: _pillowColor,
                                        watch: widget.watch),
                                  ));
                            }),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              child: IntrinsicHeight(
                            child: _stepDisplay(context),
                          )),
                        ),
                      ],
                    ),
                  ),
                )),
                _buildFooter(context)
              ],
            )
          ],
        ));
  }

  SafeArea _buildFooter(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Container(
          // color: Colors.red,
          child: Column(
        children: [
          _buildActionRow(context),
          SizedBox(
            height: 20,
          ),
          Text("About".toUpperCase(),
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: Colors.black,
                  )),
          const SizedBox(
            height: 5,
          ),
          Icon(FeatherIcons.moreVertical)
        ],
      )),
    );
  }

  Widget _stepDisplay(BuildContext context) {
    late Widget step;
    switch (_stepCheckout) {
      case 0:
        step = InfoStepWidget(watch: widget.watch);
        break;
      case 1:
        // if (_pillowAnimation.status == AnimationStatus.completed) {
        //   _pillowController.reverse();
        // } else {
        //   _pillowController.forward();
        // }
        step = PillowStepWidget(
          watch: widget.watch,
          pillowColor: _pillowColor,
          onColorChanged: (color) {
            setState(() {
              _pillowColor = color;
            });
          },
        );
        break;
      case 2:
        step = BoxStepWidget(
          watch: widget.watch,
          boxColor: _boxColor,
          onColorChanged: (color) {
            setState(() {
              _boxColor = color;
            });
          },
        );
        break;
      case 3:
        step = CheckoutStepWidget();
        break;
      default:
        step = const SizedBox(
          height: 50,
        );
    }
    return AnimatedSwitcher(
        transitionBuilder: (child, animation) {
          // 1.
          final offsetAnimation = Tween(
            begin: const Offset(1.0, 0.0),
            end: const Offset(0.0, 0.0),
          ).animate(animation);
          // 3.
          return ClipRect(
            // 2.
            child: FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: offsetAnimation,
                child: child,
              ),
            ),
          );
        },
        duration: const Duration(milliseconds: 800),
        child: step);
  }

  Padding _buildActionRow(BuildContext context) {
    late String textButton;
    switch (_stepCheckout) {
      case 1:
        textButton = "1/2 Next";
        break;
      case 2:
        textButton = "2/2 Next";
        break;
      case 3:
        textButton = "Checkout";
        break;
      default:
        textButton = "ADD TO CART";
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xFFA4786E),
                borderRadius: BorderRadius.circular(25),
              ),
              child: IconButton(
                  onPressed: () {
                    // hand Animation

                    switch (_stepCheckout) {
                      case 0:
                        Navigator.of(context).pop();
                        break;
                      case 1:
                        _pillowController.reverse();
                        break;
                      case 2:
                        _topController.reverse().then((value) {
                          _boxController.reverse();
                        });
                        break;
                      case 3:
                        _checkoutController.reverse();
                        break;
                      default:
                    }
                    setState(() {
                      _stepCheckout--;
                    });
                  },
                  color: Colors.white,
                  icon: const Icon(FeatherIcons.arrowLeft))),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Color(0xFFA4786E),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                ),
                onPressed: () {
                  // hand Animation
                  switch (_stepCheckout) {
                    case 0:
                      _pillowController.forward();
                      break;
                    case 1:
                      _boxController.forward().then((value) => _topController.forward());
                      break;
                    case 2:
                      _checkoutController.forward();
                      break;
                    default:
                  }
                  setState(() {
                    _stepCheckout++;
                  });
                },
                child: Text(textButton.toUpperCase(),
                    style: Theme.of(context).textTheme.button!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ))),
          ),
          const SizedBox(
            width: 15,
          ),
          AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              width: _stepCheckout > 2 ? 0 : 50,
              decoration: BoxDecoration(
                color: Color(0xFFA4786E),
                borderRadius: BorderRadius.circular(25),
              ),
              child:
                  IconButton(onPressed: () {}, color: Colors.white, icon: const Icon(FeatherIcons.bookmark))),
        ],
      ),
    );
  }

  void _initControllers() {
    _pillowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _boxController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _topController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _checkoutController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }
}
