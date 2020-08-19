import 'package:flutter/material.dart';

class RoundedTextField extends StatefulWidget {
  final double _height = 48;
  final String hintText;
  final IconData icon;
  final Color backgroundColor;
  final String errorText;
  final bool isSecure;
  final TextInputType keyboardType;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final TextInputAction textInputAction;
  final Function(String) onChanged;
  final Function onEditingComplete;

  RoundedTextField({
    this.hintText,
    this.icon,
    this.backgroundColor,
    this.errorText,
    this.isSecure = false,
    this.keyboardType,
    this.focusNode,
    this.nextFocusNode,
    this.textInputAction,
    this.onChanged,
    this.onEditingComplete
  }) : assert(backgroundColor != null);

  @override
  _RoundedTextFieldState createState() => _RoundedTextFieldState(isSecure: isSecure);
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  bool isSecure;

  _RoundedTextFieldState({this.isSecure});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        children: <Widget>[
          Container(
            height: widget._height,
            decoration: BoxDecoration(
              color: widget.backgroundColor.withAlpha(30),
              borderRadius: BorderRadius.circular(29),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: TextField(
              textInputAction: widget.textInputAction,
              keyboardType: widget.keyboardType,
              focusNode: widget.focusNode,
              onEditingComplete: () {
                if (widget.focusNode != null && widget.nextFocusNode != null) {
                  widget.focusNode.unfocus();
                  FocusScope.of(context).requestFocus(widget.nextFocusNode);
                }
                if (widget.onEditingComplete != null) {
                  widget.onEditingComplete();
                }
              },
              obscureText: isSecure,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                errorText: widget.errorText,
                contentPadding: EdgeInsets.only(top: 15, left: 12),
                errorStyle: TextStyle(fontSize: 12),
                prefixIcon: Icon(
                  widget.icon,
                  color: widget.backgroundColor,
                ),
                suffixIcon:
                  // use widget for the first immutable state
                  widget.isSecure ? IconButton(
                    icon: isSecure
                        ? Icon(Icons.visibility_off, color: widget.backgroundColor)
                        : Icon(Icons.visibility, color: widget.backgroundColor),
                    onPressed: () {
                      setState(() => isSecure = !isSecure);
                    },
                  ) : null,
                hintText: widget.hintText,
                border: InputBorder.none
              ),
            ),
          )
        ],
      ),
    );
  }
}
