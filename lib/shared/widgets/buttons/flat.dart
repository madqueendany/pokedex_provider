import 'package:flutter/material.dart';

class PokeFlatButton extends StatelessWidget {
  final String title;
  final EdgeInsets padding;
  final Color fillColor;
  final Color textColor;
  final Function onPressed;
  final Alignment alignment;
  final Widget child;
  final Color borderColor;
  final double fontSize;
  final double borderRadius;
  final ShapeBorder shapeBorder;
  final Widget background;

  const PokeFlatButton(
    this.title, {
    Key key,
    this.padding = const EdgeInsets.all(16.0),
    this.fillColor = Colors.black87,
    this.textColor = Colors.white,
    this.alignment = Alignment.center,
    @required this.onPressed,
    this.borderColor,
    this.child,
    this.fontSize = 14.0,
    this.borderRadius = 16.0,
    this.shapeBorder, this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: this.fillColor,
      shape: this.shapeBorder,
      child: InkWell(
        // borderRadius: BorderRadius.circular(8.0),
        child: Container(
          padding: this.padding,
          alignment: this.alignment,
          decoration: BoxDecoration(
            border: Border.all(
              color: this.borderColor ?? this.fillColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(borderRadius / 2),
          ),
          child: this.child ??
              Text(
                this.title,
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: this.textColor, fontSize: this.fontSize),
              ),
        ),
        onTap: this.onPressed,
      ),
    );
  }
}
