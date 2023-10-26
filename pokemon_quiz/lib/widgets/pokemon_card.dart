import 'package:flutter/material.dart';
import 'package:pokedex/api/pokeapi.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon_data.dart';
import 'package:pokedex/widgets/pokemon_card_background.dart';
import 'package:pokedex/widgets/pokemon_card_data.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({required this.pokemon, super.key});
  final Pokemon pokemon;

  BoxDecoration getContainerDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: Colors.grey.withOpacity(0.24),
          width: 1,
        ),
      );

  Future<PokemonData> getPokemonData() async {
    return pokemon.pokemonData = await PokeAPI.getPokemonData(
      pokemon.url,
    );
  }

  void navigateToDetails(context) {
    Navigator.pushNamed(
      context,
      '/details',
      arguments: pokemon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //é uma área que responde ao toque
      borderRadius: BorderRadius.circular(7),
      enableFeedback: true,
      splashColor: Colors.red.shade50,
      onTap: () {
        getPokemonData().then((value) => navigateToDetails(context));
      },
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: getContainerDecoration(),
        child: Stack(
          children: [
            PokemonCardBackground(id: pokemon.id),
            PokemonCardData(pokemon: pokemon),
          ],
        ),
      ),
    );
  }
}
