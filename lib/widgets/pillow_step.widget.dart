import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:watch_animation_flutter/widgets/color_selector.widget.dart';

import '../watch.model.dart';

class PillowStepWidget extends StatelessWidget {
  final Watch watch;
  final Color pillowColor;
  final ColorCallback onColorChanged;
  const PillowStepWidget(
      {super.key, required this.watch, required this.pillowColor, required this.onColorChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Pillow color",
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
        const SizedBox(
          height: 15,
        ),
        Text("Choose the color of your pillow",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black.withOpacity(.7),
                )),
        const SizedBox(
          height: 15,
        ),
        ColorSelector(currentColor: pillowColor, onColorChanged: onColorChanged),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
