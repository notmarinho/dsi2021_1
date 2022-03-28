import 'package:dsi2021_1/gridController.dart';
import 'package:dsi2021_1/pairRow.dart';
import 'package:english_words/english_words.dart';
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
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: const RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18.0);
  bool gridMode = false;

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (context) {
        final tiles = _saved.map((pair) {
          return ListTile(
            title: Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
          );
        });

        final divided = tiles.isNotEmpty
            ? ListTile.divideTiles(context: context, tiles: tiles).toList()
            : <Widget>[];

        return Scaffold(
          appBar: AppBar(
            title: const Text('Saved Suggestions'),
          ),
          body: ListView(children: divided),
        );
      }),
    );
  }

  void removeSuggestion(WordPair pair) {
    setState(() {
      _suggestions.remove(pair);
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
        title: const Text('Startup Name Generator'),
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
                if (i >= _suggestions.length) {
                  _suggestions.addAll(generateWordPairs().take(10));
                }

                var currentPair = _suggestions[i];

                return PairRow(
                  pair: currentPair,
                  alreadySaved: _saved.contains(currentPair),
                  removePair: removeSuggestion,
                  save: saveSuggestion,
                  unSave: unSaveSuggestion,
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
