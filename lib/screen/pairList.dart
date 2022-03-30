import 'package:dsi2021_1/utils/appRoutes.dart';
import 'package:english_words/english_words.dart';
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
  final _saved = <WordPair>[];
  bool gridMode = false;

  void _pushSaved() {
    Navigator.of(context).pushNamed(AppRoutes.PAIR_SAVED, arguments: _saved);
  }

  void _pushEdit(WordPair pair) {
    Navigator.of(context).pushNamed(AppRoutes.PAIR_EDIT, arguments: pair);
  }

  void removeSuggestion(WordPair pair) {
    setState(() {
      parPalavraRepositorio.paresPalavra.remove(pair);
      _saved.remove(pair);
    });
  }

  void saveSuggestion(WordPair pair) {
    setState(() {
      _saved.add(pair);
    });
  }

  void unSaveSuggestion(WordPair pair) {
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
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, int i) {
                if (i >= parPalavraRepositorio.paresPalavra.length) {
                  parPalavraRepositorio.addMore();
                }

                var currentPair = parPalavraRepositorio.paresPalavra[i];

                return PairRow(
                  pair: currentPair,
                  alreadySaved: _saved.contains(currentPair),
                  removePair: removeSuggestion,
                  save: saveSuggestion,
                  unSave: unSaveSuggestion,
                  onRowPress: _pushEdit,
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: gridMode ? 2 : 1,
                mainAxisExtent: 65,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
