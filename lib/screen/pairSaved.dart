import 'package:dsi2021_1/models/par_palavra.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class PairSaved extends StatelessWidget {
  const PairSaved({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ParPalavra> savedPairList =
        ModalRoute.of(context)?.settings.arguments as List<ParPalavra>;

    final tiles = savedPairList.map((pair) {
      return ListTile(
        title: Text(
          pair.toString(),
        ),
      );
    });

    final divided = tiles.isNotEmpty
        ? ListTile.divideTiles(context: context, tiles: tiles).toList()
        : <Widget>[];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Palavras Salvas'),
      ),
      body: ListView(
        children: divided,
      ),
    );
  }
}
