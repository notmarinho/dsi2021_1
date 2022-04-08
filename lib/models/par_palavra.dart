class ParPalavra {
  String primeira;
  String segunda;
  final bool isFavorite;

  ParPalavra(
      {required this.primeira,
      required this.segunda,
      required this.isFavorite});

  factory ParPalavra.fromJson(Map<String, dynamic> json) => ParPalavra(
        primeira: json['primeira'],
        segunda: json['segunda'],
        isFavorite: json['isFavorite'],
      );

  Map<String, Object?> toJson() {
    return {
      'primeira': primeira,
      'segunda': segunda,
      'isFavorite': isFavorite,
    };
  }

  @override
  String toString() {
    return '$primeira $segunda';
  }
}
