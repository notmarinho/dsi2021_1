import 'package:dsi2021_1/components/fab_add_palavra.dart';
import 'package:dsi2021_1/components/palavra_collection.dart';
import 'package:dsi2021_1/models/par_palavra.dart';
import 'package:dsi2021_1/screen/pair_set.dart';
import 'package:dsi2021_1/utils/appRoutes.dart';
import 'package:flutter/material.dart';

import '../utils/gridController.dart';

class PairList extends StatefulWidget {
  const PairList({Key? key}) : super(key: key);

  @override
  State<PairList> createState() => _PairListState();
}

class _PairListState extends State<PairList> {
  bool gridMode = false;

  void _pushSaved() {
    Navigator.of(context).pushNamed(AppRoutes.PAIR_SAVED);
  }


  void toggleGrid(bool value) {
    setState(() {
      gridMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StartUp Name'),
        actions: [
          IconButton(onPressed: _pushSaved, icon: const Icon(Icons.list))
        ],
      ),
      body: const PairCollection(),
      floatingActionButton: const FabAddPalavra(),
    );
  }
}
