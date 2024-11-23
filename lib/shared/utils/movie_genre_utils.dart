enum MovieGenre {
  action(28, "Ação"),
  adventure(12, "Aventura"),
  animation(16, "Animação"),
  comedy(35, "Comédia"),
  crime(80, "Crime"),
  documentary(99, "Documentário"),
  drama(18, "Drama"),
  family(10751, "Família"),
  fantasy(14, "Fantasia"),
  history(36, "História"),
  horror(27, "Terror"),
  music(10402, "Música"),
  mystery(9648, "Mistério"),
  romance(10749, "Romance"),
  sciFi(878, "Ficção científica"),
  tvMovie(10770, "Cinema TV"),
  thriller(53, "Thriller"),
  war(10752, "Guerra"),
  western(37, "Faroeste");

  final int id;
  final String name;

  const MovieGenre(this.id, this.name);

  static String? getNameById(int? id) {
    try {
      return values.firstWhere((element) => element.id == id).name;
    } catch (e) {
      return null;
    }
  }
}
