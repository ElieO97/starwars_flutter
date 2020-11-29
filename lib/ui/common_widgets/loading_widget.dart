
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {

  const LoadingWidget({Key key, @required this.visible}) : super(key: key);

  final bool visible;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 1300),
      opacity: visible ? 1.0 : 0.0,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        alignment: FractionalOffset.center,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
