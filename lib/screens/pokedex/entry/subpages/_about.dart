import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _LineItem(label: 'Species', value: 'Seed'),
      ],
    );
  }
}

class _LineItem extends StatelessWidget {
  final String label;
  final String value;

  const _LineItem({Key key, this.label, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 24.0, right: 64.0),
          child: Text(this.label),
        ),
        Padding(
          padding: EdgeInsets.only(left: 24.0, right: 64.0),
          child: Text(this.value),
        ),
      ],
    );
  }
}
