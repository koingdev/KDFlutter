import 'package:flutter/material.dart';

class TouchOutsideDismissKeyboardContainer extends StatelessWidget {

  final Widget child;

  const TouchOutsideDismissKeyboardContainer({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          currentFocus.unfocus();
        }
      },
      child: child,
    );
  }
}
