import 'package:dsi2021_1/models/par_palavra.dart';

class ParPalavraRepository {
  final List<ParPalavra> paresPalavra = [];

  ParPalavraRepository() {
    initWords();
  }

  void initWords() {
    paresPalavra.addAll([
      ParPalavra('Caes', 'Ceric'),
      ParPalavra('Taxiorion', 'Beingoi'),
      ParPalavra('Osxoadan', 'Pinruor'),
      ParPalavra('Platen', 'Iskuwog'),
      ParPalavra('Bokedor', 'Vupyegrim'),
      ParPalavra('Nusni', 'Waxedin'),
      ParPalavra('Nagpo', 'Baon'),
      ParPalavra('Xuyci', 'Gatgou'),
      ParPalavra('Farirandir', 'Ceric'),
      ParPalavra('Ellouise', 'Marks'),
      ParPalavra('Beatrice', 'Hale'),
      ParPalavra('Magnus', 'Bell'),
      ParPalavra('Piper', 'Mcgowan'),
      ParPalavra('Levison', 'Drew'),
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
