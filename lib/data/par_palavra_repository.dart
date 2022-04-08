import 'package:dsi2021_1/models/par_palavra.dart';

class ParPalavraRepository {
  final List<ParPalavra> paresPalavra = [];

  ParPalavraRepository() {
    initWords();
  }

  void initWords() {
    paresPalavra.addAll([
      ParPalavra('Caes', 'Ceric', false),
      ParPalavra('Taxiorion', 'Beingoi', false),
      ParPalavra('Osxoadan', 'Pinruor', false),
      ParPalavra('Platen', 'Iskuwog', false),
      ParPalavra('Bokedor', 'Vupyegrim', false),
      ParPalavra('Nusni', 'Waxedin', false),
      ParPalavra('Nagpo', 'Baon', false),
      ParPalavra('Xuyci', 'Gatgou', false),
      ParPalavra('Farirandir', 'Ceric', false),
      ParPalavra('Ellouise', 'Marks', false),
      ParPalavra('Beatrice', 'Hale', false),
      ParPalavra('Magnus', 'Bell', false),
      ParPalavra('Piper', 'Mcgowan', false),
      ParPalavra('Levison', 'Drew', false),
    ]);
  }

  add(ParPalavra newPar) {
    paresPalavra.insert(0, newPar);
  }

  List<ParPalavra> getAll() {
    return paresPalavra;
  }

  ParPalavra getFirst() {
    return paresPalavra.first;
  }

  ParPalavra getByIndex(int index) {
    return paresPalavra.elementAt(index);
  }
}
