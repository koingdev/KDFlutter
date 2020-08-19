import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final double _height = 48;
  final bool enabled;
  final Widget title;
  final Gradient gradient;
  final Function onPressed;

  const GradientButton({
    this.enabled = true,
    this.title,
    this.gradient,
    this.onPressed
  }): assert(title != null && gradient != null);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: _height,
        width: double.infinity,
        decoration: enabled ? BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 6, color: Colors.black26, offset: Offset(0, 3))
          ],
          borderRadius: BorderRadius.all(Radius.circular(4)),
          gradient: gradient,
        ) : null,
        child: FlatButton(
          disabledColor: Colors.black26,
          onPressed: enabled ? onPressed : null,
          child: title,
        )
    );
  }
}