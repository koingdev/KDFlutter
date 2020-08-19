import 'package:flutter/material.dart';

class FloatingTextField extends StatefulWidget {

  final bool enabled;
  final String floatingText;
  final String hint;
  final String errorText;
  final TextInputType keyboardType;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final TextInputAction textInputAction;
  final Function(String) onChanged;

  const FloatingTextField({
    Key key,
    this.enabled = true,
    this.floatingText,
    this.hint,
    this.errorText,
    this.keyboardType,
    this.focusNode,
    this.nextFocusNode,
    this.textInputAction,
    this.onChanged
  }) : super(key: key);

  @override
  _FloatingTextFieldState createState() => _FloatingTextFieldState();
}

class _FloatingTextFieldState extends State<FloatingTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        focusNode: widget.focusNode,
        onEditingComplete: () {
          if (widget.focusNode != null && widget.nextFocusNode != null) {
            widget.focusNode.unfocus();
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
          }
        },
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          errorText: widget.errorText,
          labelText: widget.floatingText,
          hintText: widget.hint,
          enabled: widget.enabled,
        )
    );
  }
}
