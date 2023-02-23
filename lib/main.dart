import 'package:flutter/material.dart';
import 'package:watch_animation_flutter/list_watches.page.dart';

import 'config/theme.config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("===> DESIGN CHALLENGE: Watch Animation Flutter");
    return MaterialApp(
      title: 'Watch Animation Flutter Demo',
      debugShowCheckedModeBanner: false,
      // showPerformanceOverlay: true,
      // showPerformanceOverlay: true,
      theme: CustomTheme.lightTheme,
      home: const ListWatchesPage(),
    );
  }
}
