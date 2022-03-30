import 'package:english_words/english_words.dart';

class ParPalavraRepository {
  final List<WordPair> paresPalavra = [];

  ParPalavraRepository() {
    initWords();
  }

  void initWords() {
    paresPalavra.addAll(generateWordPairs().take(20));
  }

  void addMore() {
    paresPalavra.addAll(generateWordPairs().take(10));
  }

  List<WordPair> getAll() {
    return paresPalavra;
  }

  WordPair getFirst() {
    return paresPalavra.first;
  }

  WordPair getByIndex(int index) {
    return paresPalavra.elementAt(index);
  }
}
