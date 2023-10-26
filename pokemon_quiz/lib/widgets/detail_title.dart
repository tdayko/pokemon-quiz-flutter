import 'package:flutter/gestures.dart';
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
      shape: const RoundedRectangleBorder(),
      child: Chip(
          backgroundColor: Colors.white,
          avatar: CircleAvatar(
            child: Text('1' as String),
          ),
          label: Padding(padding: EdgeInsets.symmetric(horizontal: 10.0))
          Text(
            pokemon.name.capitalize(),
            style: const TextStyle(
              fontSize: 45,
              color: Colors.black,
            ),
          )),
    );
  }
}
