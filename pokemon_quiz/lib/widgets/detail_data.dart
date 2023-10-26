import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class DetailData extends StatelessWidget {
  const DetailData({required this.pokemon, super.key});
  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width,
        minHeight: 500,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.02, 0.02],
          colors: [Colors.grey, Colors.white],
        ),
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(71),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Peso: ${pokemon.pokemonData!.weightInKg} kg',
            style: const TextStyle(fontSize: 24),
          ),
          Text(
            'Altura: ${pokemon.pokemonData!.heightInMeters} m',
            style: const TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
