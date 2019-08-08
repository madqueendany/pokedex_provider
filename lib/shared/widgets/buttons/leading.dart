import 'dart:io';

import 'package:flutter/material.dart';

class PokeLeading extends StatelessWidget {
  final Function onPressed;
  final Color color;

  const PokeLeading({
    Key key,
    this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32.0),
      child: Material(
        color: Colors.transparent,
        child: IconButton(
          icon: Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back),
          color: this.color ?? Colors.black87,
          onPressed: this.onPressed ?? () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
