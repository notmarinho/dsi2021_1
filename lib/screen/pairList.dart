import 'package:dsi2021_1/models/par_palavra.dart';
import 'package:dsi2021_1/utils/appRoutes.dart';
import 'package:flutter/material.dart';

import '../components/pairRow.dart';
import '../data/par_palavra_repository.dart';
import '../utils/gridController.dart';

class PairList extends StatefulWidget {
  const PairList({Key? key}) : super(key: key);

  @override
  State<PairList> createState() => _PairListState();
}

class _PairListState extends State<PairList> {
  final parPalavraRepositorio = ParPalavraRepository();
  final _saved = <ParPalavra>[];
  bool gridMode = false;

  void _pushSaved() {
    Navigator.of(context).pushNamed(AppRoutes.PAIR_SAVED, arguments: _saved);
  }

  Future<void> _pushEdit(ParPalavra pair) async {
    await Navigator.of(context).pushNamed(AppRoutes.PAIR_EDIT, arguments: pair);
    setState(() {});
  }

  Future<void> _pushAdd() async {
    var newPair = await Navigator.of(context).pushNamed(AppRoutes.PAIR_EDIT)
        as ParPalavra?;
    if (newPair != null) {
      setState(() {
        parPalavraRepositorio.add(newPair);
      });
    }
  }

  void removeSuggestion(ParPalavra pair) {
    setState(() {
      parPalavraRepositorio.paresPalavra.remove(pair);
      _saved.remove(pair);
    });
  }

  void saveSuggestion(ParPalavra pair) {
    setState(() {
      _saved.add(pair);
    });
  }

  void unSaveSuggestion(ParPalavra pair) {
    setState(() {
      _saved.remove(pair);
    });
  }

  void toggleGrid(bool value) {
    setState(() {
      gridMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var parPalavraWidgets = parPalavraRepositorio
        .getAll()
        .map(
          (parPalavra) => PairRow(
            pair: parPalavra,
            alreadySaved: _saved.contains(parPalavra),
            removePair: removeSuggestion,
            save: saveSuggestion,
            unSave: unSaveSuggestion,
            onRowPress: _pushEdit,
          ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('StartUp Name'),
        actions: [
          IconButton(onPressed: _pushSaved, icon: const Icon(Icons.list))
        ],
      ),
      body: Column(
        children: [
          GridController(isGridMode: gridMode, toggleGrid: toggleGrid),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 100),
              itemCount: parPalavraRepositorio.getAll().length,
              itemBuilder: (context, int index) => PairRow(
                pair: parPalavraRepositorio.getByIndex(index),
                alreadySaved:
                    _saved.contains(parPalavraRepositorio.getByIndex(index)),
                removePair: removeSuggestion,
                save: saveSuggestion,
                unSave: unSaveSuggestion,
                onRowPress: _pushEdit,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: gridMode ? 2 : 1,
                mainAxisExtent: 65,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pushAdd,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
