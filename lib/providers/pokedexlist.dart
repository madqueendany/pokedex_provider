import 'package:flutter/material.dart';
import 'package:pokedex_01/models/creature.dart';
import 'package:pokedex_01/models/pokedex_list.dart';
import 'package:pokedex_01/resources/api.dart';

class PokedexListModel with ChangeNotifier {
  final PokeApi api;
  PokedexList _list;

  List<Creature> _creatures = [];

  PokedexListModel(this.api);

  PokedexList get list => _list;

  List<Creature> get creatures => _creatures;

  Future<Null> getList() async {
    dynamic res = await this.api.dispatch('pokemon/');

    if (res != null) {
      _list = PokedexList.fromJson(res);
    }

    notifyListeners();
  }
}