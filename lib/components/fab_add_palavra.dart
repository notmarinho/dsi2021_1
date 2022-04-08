import 'package:flutter/material.dart';

import '../models/par_palavra.dart';
import '../screen/pairSet.dart';
import '../utils/appRoutes.dart';

class FabAddPalavra extends StatelessWidget {
  const FabAddPalavra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    navigateToAddPalavra() {
      Navigator.of(context).pushNamed(AppRoutes.PAIR_SET,
          arguments: PairSetArguments(ParPalavra('', '', false), null));
    }

    return FloatingActionButton(
      onPressed: navigateToAddPalavra,
      backgroundColor: Colors.blue,
      child: const Icon(Icons.add),
    );
  }
}
