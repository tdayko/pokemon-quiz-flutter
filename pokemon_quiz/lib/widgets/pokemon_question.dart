import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/utils/string_extension.dart';

class PokemonQuiz extends StatelessWidget {
  const PokemonQuiz({
    required this.correctPokemon,
    required this.incorrectPokemons,
    required this.onAnswerSelected,
    Key? key,
  }) : super(key: key);

  final Pokemon correctPokemon;
  final List<Pokemon> incorrectPokemons;
  final Function(bool) onAnswerSelected;

  @override
  Widget build(BuildContext context) {
    final List<Pokemon> allPokemons = [...incorrectPokemons, correctPokemon];
    allPokemons.shuffle();

    // Crie uma lista de letras para representar as opções
    final List<String> optionLetters = ['A', 'B', 'C', 'D'];

    return Column(
      children: allPokemons.asMap().entries.map((entry) {
        final index = entry.key;
        final pokemon = entry.value;
        final isCorrect = (pokemon == correctPokemon);
        final optionLetter = optionLetters[index]; // Seleciona a letra correta

        return PokemonOption(
          pokemon: pokemon,
          isCorrect: isCorrect,
          optionLetter: optionLetter,
          onSelected: () => onAnswerSelected(isCorrect),
        );
      }).toList(),
    );
  }
}

class PokemonOption extends StatelessWidget {
  const PokemonOption({
    required this.pokemon,
    required this.isCorrect,
    required this.optionLetter,
    required this.onSelected,
    Key? key,
  }) : super(key: key);

  final Pokemon pokemon;
  final bool isCorrect;
  final String optionLetter;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      type: MaterialType.transparency,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(21),
        ),
      ),
      child: InkWell(
        onTap: onSelected,
        child: Chip(
          backgroundColor: Colors.white,
          avatar: CircleAvatar(
            child: Text(optionLetter), // Mostra a letra em vez do ID
          ),
          label: Text(
            pokemon.name.capitalize(),
            style: const TextStyle(
              fontSize: 32,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
