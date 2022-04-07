class ParPalavra {
  String primeira;
  String segunda;

  ParPalavra(this.primeira, this.segunda);

  @override
  String toString() {
    // TODO: implement toString
    return '$primeira $segunda';
  }

  set setPrimeira(String newFirstName) {
    primeira = newFirstName;
  }

  set setSegunda(String newSecondName) {
    segunda = newSecondName;
  }
}
