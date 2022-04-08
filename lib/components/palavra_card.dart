import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/par_palavra.dart';
import '../screen/pairSet.dart';
import '../utils/appRoutes.dart';

class PalavraCard extends StatelessWidget {
  final DocumentSnapshot document;
  late final ParPalavra parPalavra;
  final CollectionReference palavras =
      FirebaseFirestore.instance.collection('palavras');

  PalavraCard(this.document, {Key? key}) : super(key: key) {
    instanceData(document);
  }

  void instanceData(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    parPalavra = ParPalavra(
      data['primeira'],
      data['segunda'],
      data['isFavorite'],
    );
  }

  Future<void> onSavePress() async {
    if (parPalavra.isFavorite) {
      palavras.doc(document.id).update({'isFavorite': false});
    } else {
      palavras.doc(document.id).update({'isFavorite': true});
    }
  }

  Future<void> onDelete() async {
    palavras.doc(document.id).delete();
  }

  @override
  Widget build(BuildContext context) {
    onCardPress() {
      Navigator.of(context).pushNamed(AppRoutes.PAIR_SET,
          arguments: PairSetArguments(parPalavra, document.id));
    }

    return Card(
      child: Dismissible(
        key: Key(document.id),
        onDismissed: (_) => onDelete(),
        background: Container(color: Colors.red),
        child: ListTile(
          title: Text(parPalavra.toString()),
          onTap: onCardPress,
          trailing: IconButton(
            onPressed: onSavePress,
            icon: Icon(
              parPalavra.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: parPalavra.isFavorite ? Colors.red : null,
            ),
          ),
        ),
      ),
    );
  }
}
