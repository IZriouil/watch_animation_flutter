import 'package:flutter/material.dart';
import 'package:watch_animation_flutter/list_watches.page.dart';
import 'package:watch_animation_flutter/watch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Watch Animation Flutter Demo',
      debugShowCheckedModeBanner: false,
      // showPerformanceOverlay: true,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListWatchesPage(),
    );
  }
}
