import 'package:dsi2021_1/models/par_palavra.dart';
import 'package:flutter/material.dart';

class PairRow extends StatelessWidget {
  final ParPalavra pair;
  final bool alreadySaved;
  final void Function(ParPalavra) removePair;
  final void Function(ParPalavra) save;
  final void Function(ParPalavra) unSave;
  final void Function(ParPalavra) onRowPress;

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
        key: Key(pair.toString()),
        child: ListTile(
          onTap: () => onRowPress(pair),
          title: Text(pair.toString()),
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
