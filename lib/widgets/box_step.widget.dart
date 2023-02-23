import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:watch_animation_flutter/widgets/color_selector.widget.dart';

import '../watch.model.dart';

class BoxStepWidget extends StatelessWidget {
  final Watch watch;
  final Color boxColor;
  final ColorCallback onColorChanged;
  const BoxStepWidget({super.key, required this.watch, required this.boxColor, required this.onColorChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Watch Box color",
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
        const SizedBox(
          height: 15,
        ),
        Text("Choose the color of the watch box",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black.withOpacity(.7),
                )),
        const SizedBox(
          height: 15,
        ),
        ColorSelector(
          currentColor: boxColor,
          onColorChanged: onColorChanged,
          isBoxColor: true,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
