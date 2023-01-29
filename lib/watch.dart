import 'package:flutter/material.dart';
import 'package:watch_animation_flutter/widgets/watch_pillow.widget.dart';

import 'widgets/box_face.widget.dart';

class WatchApplication extends StatefulWidget {
  const WatchApplication({super.key});

  @override
  State<WatchApplication> createState() => _WatchApplicationState();
}

class _WatchApplicationState extends State<WatchApplication> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFDFDFDF),
      body: Center(child: BoxFaceWidget()),
    );
  }
}
