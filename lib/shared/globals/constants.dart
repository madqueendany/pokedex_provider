import 'package:flutter/material.dart';
import 'package:pokedex_01/shared/globals/enums.dart';
import 'package:pokedex_01/shared/theme/colors.dart';

Map<PokeType, Color> typeColors = {
  PokeType.normal: Colors.grey[300],
  PokeType.fighting: Colors.brown,
  PokeType.flying: Colors.cyan,
  PokeType.poison: Colors.purple,
  PokeType.ground: Colors.brown,
  PokeType.rock: Colors.brown[400],
  PokeType.bug: Colors.green[200],
  PokeType.ghost: Colors.black,
  PokeType.steel: Colors.black,
  PokeType.fire: PokeColors.fire.withOpacity(0.8),
  PokeType.water: PokeColors.water,
  PokeType.grass: PokeColors.grass,
  PokeType.electric: Colors.black,
  PokeType.psychic: Colors.black,
  PokeType.ice: Colors.black,
  PokeType.dragon: Colors.black,
  PokeType.dark: Colors.black,
  PokeType.fairy: Colors.black,
  PokeType.unknown: Colors.black,
  PokeType.shadow: Colors.black,
};
