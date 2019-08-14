import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:pokedex_01/providers/pokedexlist.dart';
import 'package:pokedex_01/resources/api.dart';
import 'package:pokedex_01/screens/pokedex/entries/grid.dart';
import 'package:pokedex_01/shared/theme/colors.dart';
import 'package:pokedex_01/shared/widgets/buttons/leading.dart';
import 'package:pokedex_01/shared/widgets/placeholders/list_items.dart';

class MovesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider<PokeApi, PokedexListModel>(
      builder: (context, api, model) => PokedexListModel(api),
      child: Scaffold(
        backgroundColor: PokeColors.whiteSmoke,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverOverlapAbsorber(
              handle: SliverOverlapAbsorberHandle(),
            ),
            PokdexAppBar(),
            _Body(),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<PokedexListModel>(
      builder: (context) async* {
        PokedexListModel _model = Provider.of<PokedexListModel>(context);

        await _model.getList();

        yield _model;
      },
      child: Consumer<PokedexListModel>(
        builder: (_, provider, __) {
          if (provider == null)
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
          else
            return SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) =>
                    GridEntry(entry: provider.list.results[index]),
                childCount: provider.list.results.length,
              ),
            );
        },
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
          'Moves simulator',
          style: Theme.of(context).textTheme.display1.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.black87,
              letterSpacing: 1.5,
              fontSize: 26.0),
        ),
        centerTitle: false,
      ),
    );
  }
}
