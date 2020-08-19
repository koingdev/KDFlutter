import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {

  Widget _divider() {
    return Expanded(
      child: Divider(
        color: Colors.black54,
        height: 1.5,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          _divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "or",
              style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          _divider()
        ],
      ),
    );
  }
}
