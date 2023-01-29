import 'package:flutter/material.dart';

class WatchPillowWidget extends StatelessWidget {
  const WatchPillowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // return DecoratedBox(
    //   decoration: BoxDecoration(
    //     image: DecorationImage(
    //         colorFilter: ColorFilter.mode(Colors.red.withOpacity(.8), BlendMode.multiply),
    //         image: const AssetImage("assets/images/watch_pillow.png"),
    //         fit: BoxFit.fill),

    //     // colorBlendMode: BlendMode.multiply,
    //   ),
    //   child: Container(),
    // );
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: 5,
          child: Image.asset(
            "assets/images/watch_pillow.png",
            color: Colors.black.withOpacity(.8),
          ),
        ),
        Image.asset(
          "assets/images/watch_pillow.png",
          color: Colors.white,
        ),
        Image.asset(
          "assets/images/watch_pillow.png",
          color: Color.fromARGB(255, 184, 183, 185).withOpacity(.8),

          // color: Color(0xFFD9985C).withOpacity(.8),
          colorBlendMode: BlendMode.modulate,
        ),
      ],
    );
  }
}
