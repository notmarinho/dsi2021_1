class ParPalavra {
  String primeira;
  String segunda;
  bool isFavorite;

  ParPalavra(this.primeira, this.segunda, this.isFavorite);

  @override
  String toString() {
    return '$primeira $segunda';
  }

  set setPrimeira(String newFirstName) {
    primeira = newFirstName;
  }

  set setSegunda(String newSecondName) {
    segunda = newSecondName;
  }
}
