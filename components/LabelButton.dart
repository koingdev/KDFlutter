import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LabelButton extends StatefulWidget {
  final String title;
  final Color color;
  final double fontSize;
  final TextDecoration decoration;
  final Function onPressed;

  const LabelButton({
    this.title,
    this.color,
    this.fontSize = 16,
    this.decoration = TextDecoration.none,
    this.onPressed
  }) : assert(title != null && color != null);

  @override
  _LabelButtonState createState() => _LabelButtonState(color: color);
}

class _LabelButtonState extends State<LabelButton> {

  Color color;

  _LabelButtonState({this.color});

  void _highlight() => setState(() => color = color.withAlpha(120));

  void _unhighlight() => setState(() => color = color.withAlpha(255));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) => _highlight(),
      onTapCancel: () => _unhighlight(),
      onTapUp: (_) => _unhighlight(),
      onTap: widget.onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          widget.title,
          style: TextStyle(
            color: color,
            decoration: widget.decoration,
            fontSize: widget.fontSize
          ),
        ),
      ),
    );
  }
}
