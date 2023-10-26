import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/utils/string_extension.dart';

class DetailTitle extends StatelessWidget {
  const DetailTitle({required this.pokemon, super.key});
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      type: MaterialType.transparency,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(21),
      )),
      child: Chip(
          backgroundColor: Colors.white,
          avatar: CircleAvatar(
            child: Text(pokemon.id.toString()),
          ),
          label: Text(
            pokemon.name.capitalize(),
            style: const TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          )),
    );
  }
}
