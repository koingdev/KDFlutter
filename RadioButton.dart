import 'package:flutter/material.dart';

class RadioButton extends StatelessWidget {
  final String title;
  final Color activeColor;
  final dynamic value;
  final dynamic groupValue;
  final Function(dynamic) onChanged;

  const RadioButton({
    @required this.title,
    @required this.activeColor,
    @required this.value,
    @required this.groupValue,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Radio(
          activeColor: activeColor,
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        GestureDetector(
          child: Text(title, style: TextStyle(fontSize: 15)),
          onTap: () => onChanged(value),
        )
      ],
    );
  }
}
