import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:pokedex_01/shared/theme/colors.dart';
import 'package:pokedex_01/shared/widgets/buttons/flat.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(32),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey[300],
            offset: Offset(0, 4.0),
            blurRadius: 16.0,
          )
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(32.0),
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.display1.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                      fontSize: 26.0),
                  children: <TextSpan>[
                    TextSpan(text: 'Welcome to the\n'),
                    TextSpan(
                      text: 'Pokémon Compendium!',
                      style: Theme.of(context).textTheme.display1.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                          letterSpacing: 1.5,
                          fontSize: 26.0),
                    ),
                  ],
                ),
              ),
            ),
            SearchBar(),
            DashButtons(),
          ],
        ),
      ),
    );
  }
}

class DashButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                DashButton(
                  fillColor: Colors.green[300],
                  label: 'Pokedex',
                  onPressed: () => Navigator.of(context).pushNamed('/pokedex'),
                ),
                DashButton(
                  fillColor: Colors.blue[200],
                  label: 'Abilities',
                ),
                DashButton(
                  fillColor: Colors.purple[300],
                  label: 'Locations',
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                DashButton(
                  fillColor: Colors.red[300],
                  label: 'Moves',
                  onPressed: () => Navigator.of(context).pushNamed('/moves'),
                ),
                DashButton(
                  fillColor: Colors.orange[300],
                  label: 'Items',
                ),
                DashButton(
                  fillColor: Colors.brown[300],
                  label: 'Type Charts',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DashButton extends StatelessWidget {
  final Color fillColor;
  final String label;
  final Function onPressed;

  const DashButton({
    Key key,
    @required this.fillColor,
    @required this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: this.fillColor,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: this.fillColor,
            offset: Offset(0, 3.0),
            blurRadius: 8.0,
          )
        ],
      ),
      alignment: Alignment.centerLeft,
      child: PokeFlatButton(
        '',
        padding: EdgeInsets.zero,
        alignment: Alignment.centerLeft,
        fillColor: this.fillColor,
        shapeBorder: StadiumBorder(),
        borderRadius: 32.0,
        onPressed: this.onPressed,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              top: 30.0,
              left: 10.0,
              child: Text(
                this.label,
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: Colors.white),
              ),
            ),
            Positioned(
              top: -13.0,
              right: -13.0,
              child: SvgPicture.asset(
                'assets/svgs/pokeball.svg',
                color: Colors.grey[100].withOpacity(0.3),
                height: 60.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      margin: EdgeInsets.symmetric(horizontal: 32.0),
      decoration: BoxDecoration(
        color: PokeColors.whiteSmoke,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: TextField(
        style: Theme.of(context).textTheme.body1.copyWith(fontSize: 12.0),
        decoration: InputDecoration.collapsed(
          hintText: 'Search Pokemon, Move, Ability, etc',
        ),
      ),
    );
  }
}
