import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:pokedex_01/models/creature.dart';
import 'package:pokedex_01/models/pokedex_list.dart';
import 'package:pokedex_01/resources/api.dart';
import 'package:pokedex_01/screens/pokedex/index.dart';
import 'package:pokedex_01/shared/globals/constants.dart';
import 'package:pokedex_01/shared/widgets/buttons/flat.dart';
import 'package:pokedex_01/shared/widgets/placeholders/list_items.dart';

class GridEntry extends StatelessWidget {
  final PokedexEntry entry;

  const GridEntry({Key key, this.entry}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Creature>(
      builder: (context) async* {
        Creature _creature;
        PokeApi _api = PokeApi();

        dynamic res = await _api.dispatch(null, uri: entry.url);
        if (res != null) {
          _creature = Creature.fromJson(res);
        }

        yield _creature;
      },
      child: Consumer<Creature>(
        builder: (context, creature, child) {
          if (creature == null) return PlaceholderGridItem();

          return Container(
            margin: EdgeInsets.all(8.0),
            decoration: _buildDecoration(creature),
            child: PokeFlatButton(
              '',
              onPressed: () => Navigator.of(context).pushNamed(
                    '/pokeentry',
                    arguments: {'creature': creature},
                  ),
              fillColor: Colors.transparent,
              padding: EdgeInsets.only(left: 16.0),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 32.0),
                      Hero(
                        tag: 'pokename-${creature.name}',
                        child: Text(
                          creature.name,
                          style: Theme.of(context)
                              .textTheme
                              .body2
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      for (Types ts in creature.types) TypeLabel(ts.type.title)
                    ],
                  ),
                  Positioned(
                    bottom: -13.0,
                    right: -8.0,
                    child: SvgPicture.asset(
                      'assets/svgs/pokeball.svg',
                      color: Colors.grey[100].withOpacity(0.3),
                      height: 80.0,
                    ),
                  ),
                  Positioned(
                    bottom: -13.0,
                    right: -8.0,
                    child: Image.network(creature.sprites.frontDefault),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  BoxDecoration _buildDecoration(Creature creature) {
    // LinearGradient _gradient;

    // if (creature.types.length == 1) {
    //   _color = typeColors[creature.types.first.type];
    // } else {
    //   _gradient = LinearGradient(
    //     colors: getTypeColors(creature.types),
    //     begin: Alignment(1, 0.5),
    //     end: Alignment(0, 0),
    //     stops: [0.5, 1],
    //   );
    // }

    return BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      // gradient: _gradient,
      color: typeColors[creature.types.last.type.type],
    );
  }
}

List<Color> getTypeColors(List<Types> types) {
  List<Color> _output = [];

  types.forEach((Types t) => _output.add(typeColors[t.type.type]));

  return _output;
}
