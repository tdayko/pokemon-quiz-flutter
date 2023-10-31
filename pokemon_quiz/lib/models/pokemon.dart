import 'package:pokedex/models/pokemon_data.dart';
import 'package:pokedex/utils/constants.dart';

class Pokemon {
  String url;
  String name;
  PokemonData? pokemonData;

  Pokemon({required this.url, required this.name});

  get id {
    var urlParts = url.split('/');
    var id = urlParts.reversed.skip(1).first;
    return int.parse(id);
  }

  get image => '$pokemonImgUrl/$id.png';

  factory Pokemon.fromJson(Map<String, dynamic> jsonData) {
    return Pokemon(url: jsonData['url'], name: jsonData['name']);
  }
}
