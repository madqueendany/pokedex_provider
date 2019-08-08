import 'package:flutter/material.dart';
import 'package:pokedex_01/screens/pokedex/entry/index.dart';

import 'package:provider/provider.dart';

import 'package:pokedex_01/resources/api.dart';
import 'package:pokedex_01/screens/export.dart';

void main() => runApp(Pokendium());

class Pokendium extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      builder: (_) => PokeApi(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: Home(),
        routes: {
          '/': (context) => Home(),
          '/pokedex': (context) => PokedexPage(),
          '/pokeentry': (context) => PokeEntry(),
        },
      ),
    );
  }
}
