import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:pokedex_01/models/creature.dart';
import 'package:pokedex_01/screens/pokedex/entry/subpages/_about.dart';
import 'package:pokedex_01/screens/pokedex/index.dart';
import 'package:pokedex_01/shared/globals/constants.dart';
import 'package:pokedex_01/shared/widgets/buttons/flat.dart';
import 'package:pokedex_01/shared/widgets/buttons/leading.dart';

EdgeInsets padding = EdgeInsets.symmetric(horizontal: 16.0);

class PokeEntry extends StatelessWidget {
  // final Creature creature;

  // const PokeEntry({Key key, this.creature}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamic _args = ModalRoute.of(context).settings.arguments;

    Creature _creature = _args['creature'];

    Color _color = typeColors[_creature.types.last.type.type];

    return Provider(
      builder: (_) => _creature,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: _color,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              EntryTitle(),
              SizedBox(height: 12.0),
              Padding(
                padding: padding,
                child: Row(
                  children: <Widget>[
                    for (Types ts in _creature.types) TypeLabel(ts.type.title)
                  ],
                ),
              ),
              Container(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height),
                child: Stack(
                  // fit: StackFit.expand,
                  children: <Widget>[
                    Positioned(
                      top: 0.0,
                      right: -13.0,
                      child: SvgPicture.asset(
                        'assets/svgs/pokeball.svg',
                        color: Colors.grey[100].withOpacity(0.3),
                        height: 200.0,
                      ),
                    ),
                    Positioned(
                      top: 150.0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.7,
                        padding: EdgeInsets.only(top: 32.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30.0),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            CreatureTabSwitcher(),
                            Expanded(child: CreatureDetails()),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0.0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Image.network(
                          _creature.sprites.frontDefault,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CreatureTabSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        PokeFlatButton(
          'About',
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          fillColor: Colors.transparent,
          textColor: Colors.black87,
          onPressed: () {},
        ),
        PokeFlatButton(
          'Base Stats',
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          fillColor: Colors.transparent,
          textColor: Colors.black87,
          onPressed: () {},
        ),
        PokeFlatButton(
          'Evolution',
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          fillColor: Colors.transparent,
          textColor: Colors.black87,
          onPressed: () {},
        ),
        PokeFlatButton(
          'Moves',
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          fillColor: Colors.transparent,
          textColor: Colors.black87,
          onPressed: () {},
        ),
      ],
    );
  }
}

class CreatureDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.0),
      child: PageView(
        children: <Widget>[
          About(),
          BaseStats(),
          Evolution(),
          Moves(),
        ],
      ),
    );
  }
}

class BaseStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[200],
    );
  }
}

class Evolution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[300],
    );
  }
}

class Moves extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[400],
    );
  }
}

class EntryTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Creature>(
      builder: (context, creature, child) {
        return Padding(
          padding: padding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                creature.name,
                style: Theme.of(context).textTheme.display1.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontSize: 32.0),
              ),
              IndexNumber(id: creature.id),
            ],
          ),
        );
      },
    );
  }
}

class IndexNumber extends StatelessWidget {
  final int id;

  const IndexNumber({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.body1.copyWith(color: Colors.white),
        children: <TextSpan>[
          TextSpan(text: '#'),
          TextSpan(
            text: '${this.id}'.padLeft(3, '0'),
            style: Theme.of(context)
                .textTheme
                .body2
                .copyWith(fontSize: 16.0, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class EntryAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Creature>(
      builder: (context, creature, child) {
        return SliverAppBar(
          backgroundColor: typeColors[creature.types.last.type.type],
          leading: PokeLeading(color: Colors.white),
          floating: true,
          snap: true,
          pinned: true,
          /* flexibleSpace: FlexibleSpaceBar(
            title: Hero(
              tag: 'pokename-${creature.name}',
              child: Text(
                creature.name,
                style: Theme.of(context).textTheme.display1.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontSize: 26.0),
              ),
            ),
            centerTitle: false,
          ), */
        );
      },
    );
  }
}
