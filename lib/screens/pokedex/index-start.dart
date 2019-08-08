import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:pokedex_01/models/creature.dart';
import 'package:pokedex_01/models/pokedex_list.dart';
import 'package:pokedex_01/resources/api.dart';
import 'package:pokedex_01/screens/pokedex/entries/grid.dart';
import 'package:pokedex_01/shared/globals/constants.dart';
import 'package:pokedex_01/shared/theme/colors.dart';
import 'package:pokedex_01/shared/widgets/buttons/leading.dart';

class PokedexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PokeColors.whiteSmoke,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverOverlapAbsorber(
            handle: SliverOverlapAbsorberHandle(),
          ),
          PokdexAppBar(),
          Content(),
        ],
      ),
    );
  }
}

class PokdexAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: PokeColors.whiteSmoke,
      leading: PokeLeading(),
      floating: true,
      snap: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'Pokédex',
          style: Theme.of(context).textTheme.display1.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.black87,
              letterSpacing: 1.5,
              fontSize: 26.0),
        ),
        centerTitle: false,
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.grid_on,
          ),
          color: Colors.black87,
          onPressed: () {},
        ),
      ],
    );
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return PlaceholderGridItem();
        },
        childCount: 10,
      ),
    );
  }
}

class ListEntry extends StatelessWidget {
  final PokedexEntry entry;

  const ListEntry({Key key, this.entry}) : super(key: key);

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
          if (creature == null) return PlaceholderListItem();

          return Container(
            height: 120.0,
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: typeColors[creature.types.last.type.type],
            ),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        creature.name,
                        style: Theme.of(context)
                            .textTheme
                            .body2
                            .copyWith(color: Colors.white),
                      ),
                      SizedBox(height: 8.0),
                      for (Types ts in creature.types) TypeLabel(ts.type.title)
                    ],
                  ),
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
          );
        },
      ),
    );
  }
}

class TypeLabel extends StatelessWidget {
  final String label;

  const TypeLabel(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.grey[100].withOpacity(0.4),
      ),
      child: Text(
        this.label,
        style: Theme.of(context)
            .textTheme
            .body2
            .copyWith(fontSize: 10.0, color: Colors.white),
      ),
    );
  }
}

class PlaceholderListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.grey[300],
      ),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 120.0,
                  height: 15.0,
                  color: Colors.grey[200],
                ),
                SizedBox(height: 8.0),
                Container(
                  width: 80.0,
                  height: 15.0,
                  color: Colors.grey[200],
                ),
                SizedBox(height: 8.0),
                Container(
                  width: 80.0,
                  height: 15.0,
                  color: Colors.grey[200],
                )
              ],
            ),
          ),
          Positioned(
            bottom: -13.0,
            right: -8.0,
            child: SvgPicture.asset(
              'assets/svgs/pokeball.svg',
              color: Colors.grey[100],
              height: 80.0,
            ),
          )
        ],
      ),
    );
  }
}

class PlaceholderGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.grey[300],
      ),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 120.0,
                  height: 15.0,
                  color: Colors.grey[200],
                ),
                SizedBox(height: 8.0),
                Container(
                  width: 80.0,
                  height: 15.0,
                  color: Colors.grey[200],
                ),
                SizedBox(height: 8.0),
                Container(
                  width: 80.0,
                  height: 15.0,
                  color: Colors.grey[200],
                )
              ],
            ),
          ),
          Positioned(
            bottom: -13.0,
            right: -8.0,
            child: SvgPicture.asset(
              'assets/svgs/pokeball.svg',
              color: Colors.grey[100],
              height: 80.0,
            ),
          )
        ],
      ),
    );
  }
}
