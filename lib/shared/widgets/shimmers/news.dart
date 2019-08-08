import 'package:flutter/material.dart';
import 'package:pokedex_01/shared/theme/colors.dart';

class PlaceholderNewsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(16.0),
      child: Container(
        // color: Colors.teal[100],
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: PokeColors.lightGray.withOpacity(0.5),
                    height: 14.0,
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    color: PokeColors.lightGray.withOpacity(0.5),
                    width: 150.0,
                    height: 10.0,
                  ),
                  SizedBox(height: 8.0),
                  Container(
                      color: PokeColors.lightGray.withOpacity(0.3),
                      width: 80.0,
                      height: 10.0)
                ],
              ),
            ),
            SizedBox(width: 12.0),
            Container(
              width: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: PokeColors.lightGray.withOpacity(0.6),
              ),
            )
          ],
        ),
      ),
    );
  }
}
