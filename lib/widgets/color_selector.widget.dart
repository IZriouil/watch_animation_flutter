import 'package:flutter/material.dart';
import 'package:watch_animation_flutter/config/constants.dart';

typedef ColorCallback = void Function(Color color);

class ColorSelector extends StatelessWidget {
  final Color currentColor;
  final ColorCallback onColorChanged;
  final bool isBoxColor;
  const ColorSelector(
      {super.key, required this.currentColor, required this.onColorChanged, this.isBoxColor = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: (isBoxColor ? kBoxColors : kPillowColors)
              .map((color) => GestureDetector(
                    onTap: () => onColorChanged(color),
                    child: Container(
                      height: 55,
                      width: 55,
                      padding: EdgeInsets.all(currentColor == color ? 0 : 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black.withOpacity(.1),
                        ),
                      ),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: color,
                        ),
                      ),
                    ),
                  ))
              .toList()),
    );
  }
}
