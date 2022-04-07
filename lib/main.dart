import 'package:dsi2021_1/screen/pairSet.dart';
import 'package:dsi2021_1/screen/pairList.dart';
import 'package:dsi2021_1/screen/pairSaved.dart';
import 'package:dsi2021_1/utils/appRoutes.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      initialRoute: AppRoutes.PAIR_LIST,
      routes: {
        AppRoutes.PAIR_LIST: (context) => const PairList(),
        AppRoutes.PAIR_SAVED: (context) => const PairSaved(),
        AppRoutes.PAIR_SET: (context) => const PairEdit(),
      },
    );
  }
}
