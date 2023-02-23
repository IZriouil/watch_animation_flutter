import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class WatchAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const WatchAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leading: IconButton(
        icon: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: RotatedBox(
            quarterTurns: 1,
            child: Icon(
              FeatherIcons.barChart2,
              color: Colors.black,
            ),
          ),
        ),
        onPressed: () {},
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(
            icon: const Icon(
              FeatherIcons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),
      ],
      title: ColorFiltered(
          colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
          child: SizedBox(
            height: kToolbarHeight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images/steizy.png",
                fit: BoxFit.fitHeight,
              ),
            ),
          )),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
