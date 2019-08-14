import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
