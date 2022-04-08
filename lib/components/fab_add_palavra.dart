import 'package:flutter/material.dart';

import '../models/par_palavra.dart';
import '../screen/pair_set.dart';
import '../utils/appRoutes.dart';

class FabAddPalavra extends StatelessWidget {
  const FabAddPalavra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _pushAdd() {
      Navigator.of(context).pushNamed(AppRoutes.PAIR_SET,
          arguments: PairSetArguments(
              ParPalavra(isFavorite: false, primeira: '', segunda: ''), null));
    }

    return FloatingActionButton(
      onPressed: _pushAdd,
      backgroundColor: Colors.blue,
      child: const Icon(Icons.add),
    );
  }
}
