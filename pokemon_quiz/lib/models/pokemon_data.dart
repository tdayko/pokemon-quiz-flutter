class PokemonData {
  final int id;

  PokemonData({required this.id});

  factory PokemonData.fromJson(Map<String, dynamic> json) {
    return PokemonData(
      id: json['id'],

    );
  }
}
