import 'package:flutter/material.dart';

class SNSButton extends StatelessWidget {

  final String title;
  final Image image;
  final Function onPressed;

  const SNSButton({Key key, this.title, this.image, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 44,
        margin: EdgeInsets.symmetric(vertical: 5),
        child: OutlineButton(
          highlightedBorderColor: Colors.black54,
          child: Row(
            children: <Widget>[
              image,
              SizedBox(width: 30),
              Text(title, style: TextStyle(fontSize: 15, color: Colors.black54))
            ],
          ),
          borderSide: BorderSide(color: Colors.black54),
          onPressed: onPressed,
        ));
  }
}
