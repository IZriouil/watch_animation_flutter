import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CheckoutStepWidget extends StatelessWidget {
  const CheckoutStepWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text("Well done!",
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
        const SizedBox(
          height: 15,
        ),
        Text("You can now go back to the home page",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black.withOpacity(.7),
                )),
        const SizedBox(
          height: 10,
        ),
        OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Continue shopping")),
        const SizedBox(
          height: 15,
        ),
        Text("or",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black.withOpacity(.7),
                )),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
