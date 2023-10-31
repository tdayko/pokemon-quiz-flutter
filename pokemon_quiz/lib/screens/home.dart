import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pokedex/api/pokeapi.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/detail_image.dart';
import 'package:pokedex/widgets/detail_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Pokemon? _correctPokemon;
  List<Pokemon> _notCorrectPokemons = []; // Correção: Renomeie para _notCorrectPokemons

  @override
  void initState() {
    super.initState();
    _loadPokemon();
  }

  Future<void> _loadPokemon() async {
    final pokemonList = await PokeAPI.getPokemonList();
    final selectedPokemon = pokemonList[Random().nextInt(pokemonList.length)];
    final notCorrectPokemons = <Pokemon>[]; // Correção: Renomeie para notCorrectPokemons
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            if (_correctPokemon != null) DetailImage(pokemon: _correctPokemon!),
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

  // Função para tratar a seleção de resposta
  void _handleAnswerSelected(bool isCorrect) {
    // Aqui você pode lidar com a seleção da resposta correta ou incorreta
    // Por exemplo, você pode mostrar uma mensagem ou carregar um novo quiz
    _loadPokemon();
  }
}
