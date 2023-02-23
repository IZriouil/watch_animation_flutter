import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../watch.model.dart';

class InfoStepWidget extends StatelessWidget {
  final Watch watch;
  const InfoStepWidget({super.key, required this.watch});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(watch.name.toUpperCase(),
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
        const SizedBox(
          height: 15,
        ),
        Text("${watch.price} €",
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                )),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("MOVEMENT:",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.black.withOpacity(.7),
                      fontWeight: FontWeight.bold,
                    )),
            const SizedBox(
              width: 5,
            ),
            Text(watch.movement,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.black.withOpacity(.7),
                    )),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Case:",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.black.withOpacity(.7),
                      fontWeight: FontWeight.bold,
                    )),
            const SizedBox(
              width: 5,
            ),
            Text(watch.casetype,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.black.withOpacity(.7),
                    )),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
