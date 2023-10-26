import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/utils/string_extension.dart';

Widget build(BuildContext context) {
  return Material(
    color: Colors.white,
    type: MaterialType.transparency,
    shape: const RoundedRectangleBorder(),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Chip(
        backgroundColor: Colors.white,
        avatar: CircleAvatar(
          child: Text(1 as String),
        ),
        label: Text(
          1 as String,
          style: const TextStyle(
            fontSize: 32,
            color: Colors.black,
          ),
        ),
      ),
    ),
  );
}
