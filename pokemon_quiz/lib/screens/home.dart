import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pokedex/api/pokeapi.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/pokemon_image.dart';
import 'package:pokedex/widgets/pokemon_question.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Pokemon? _correctPokemon;
  List<Pokemon> _notCorrectPokemons = [];
  int _correctAnswers = 0;
  int _totalAttempts = 0;

  @override
  void initState() {
    super.initState();
    _loadPokemon();
  }

  Future<void> _loadPokemon() async {
    final pokemonList = await PokeAPI.getPokemonList();
    final selectedPokemon = pokemonList[Random().nextInt(pokemonList.length)];
    final notCorrectPokemons = <Pokemon>[];
    for (var i = 0; i < 3; i++) {
      final pokemon = pokemonList[Random().nextInt(pokemonList.length)];
      if (pokemon != selectedPokemon) {
        notCorrectPokemons.add(pokemon);
      }
    }

    setState(() {
      _correctPokemon = selectedPokemon;
      _notCorrectPokemons = notCorrectPokemons;
    });
  }

  void _handleAnswerSelected(bool isCorrect) {
    setState(() {
      _totalAttempts++;
      if (isCorrect) {
        _correctAnswers++;
      }

      if (_totalAttempts >= 10) {
        // Mostre o resultado e o botão de reiniciar
        _showResultDialog();
      } else {
        _loadPokemon();
      }
    });
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Resultado'),
          content: Text('Acertos: $_correctAnswers / 10'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                _resetGame();
                Navigator.of(context).pop();
              },
              child: const Text('Reiniciar'),
            ),
          ],
        );
      },
    );
  }

  void _resetGame() {
    setState(() {
      _correctAnswers = 0;
      _totalAttempts = 0;
    });
    _loadPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Text('Tentativas: $_totalAttempts / 10'),
            Text('Acertos: $_correctAnswers'),
            if (_correctPokemon != null)
              PokemonImage(pokemon: _correctPokemon!),
            if (_correctPokemon != null)
              PokemonQuiz(
                correctPokemon: _correctPokemon!,
                incorrectPokemons: _notCorrectPokemons,
                onAnswerSelected: _handleAnswerSelected,
              ),
          ],
        ),
      ),
    );
  }
}
