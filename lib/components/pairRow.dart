import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class PairRow extends StatelessWidget {
  final WordPair pair;
  final bool alreadySaved;
  final void Function(WordPair) removePair;
  final void Function(WordPair) save;
  final void Function(WordPair) unSave;
  final void Function(WordPair) onRowPress;

  const PairRow({
    Key? key,
    required this.pair,
    required this.alreadySaved,
    required this.removePair,
    required this.save,
    required this.unSave,
    required this.onRowPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onSavePress() {
      if (alreadySaved) {
        unSave(pair);
      } else {
        save(pair);
      }
    }

    return Card(
      child: Dismissible(
        onDismissed: (direction) {
          removePair(pair);
        },
        background: const DismissBackground(),
        key: Key(pair.asSnakeCase),
        child: ListTile(
          onTap: () => onRowPress(pair),
          title: Text(pair.asPascalCase),
          trailing: IconButton(
            icon: Icon(
              alreadySaved ? Icons.favorite : Icons.favorite_border,
              color: alreadySaved ? Colors.red : null,
            ),
            tooltip: 'Favoritar Nome',
            onPressed: onSavePress,
          ),
        ),
      ),
    );
    ;
  }
}

class DismissBackground extends StatelessWidget {
  const DismissBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Container(
        child: const Text(
          "Remover",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 15),
      ),
    );
  }
}
