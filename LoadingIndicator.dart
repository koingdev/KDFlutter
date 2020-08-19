import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final bool loading;
  final String text;
  final Color backgroundColor;

  const LoadingIndicator({
    this.loading,
    this.text = "",
    this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Visibility(
      visible: loading,
      child: Container(
        height: size.height,
        width: double.infinity,
        color: Colors.black.withOpacity(0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              backgroundColor: backgroundColor,
            ),
            SizedBox(height: 10),
            Text(text, style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }
}