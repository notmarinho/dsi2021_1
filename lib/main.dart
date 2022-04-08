import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsi2021_1/screen/pair_set.dart';
import 'package:dsi2021_1/screen/pair_list.dart';
import 'package:dsi2021_1/screen/pair_saved.dart';
import 'package:dsi2021_1/utils/appRoutes.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
