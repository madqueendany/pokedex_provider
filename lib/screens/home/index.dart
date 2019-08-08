import 'package:flutter/material.dart';

import 'package:pokedex_01/screens/home/_dashboard.dart';
import 'package:pokedex_01/shared/theme/colors.dart';
import 'package:pokedex_01/shared/widgets/shimmers/news.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PokeColors.whiteSmoke,
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverOverlapAbsorber(
          handle: SliverOverlapAbsorberHandle(),
        ),
        SliverToBoxAdapter(child: Dashboard()),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Pokemon News',
                  style: Theme.of(context).textTheme.title.copyWith(
                      fontWeight: FontWeight.w800, letterSpacing: 1.5),
                ),
                FlatButton(
                  child: Text(
                    'View All',
                    style: Theme.of(context).textTheme.body1.copyWith(
                        fontWeight: FontWeight.w800, letterSpacing: 1.0),
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
        PokeNews()
      ],
    );
  }
}

class PokeNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return PlaceholderNewsItem();
        },
        childCount: 8,
      ),
    );
  }
}
