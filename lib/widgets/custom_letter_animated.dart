import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

class CustomLetterAnimated extends StatelessWidget {
  final String letra;

  const CustomLetterAnimated({this.letra = ""});

  @override
  Widget build(BuildContext context) {

    return HoverWidget(
      child: Text(
        letra,
        style: TextStyle(
          fontSize: 18,
          fontFamily: "BaskervilleOldFace",
          // fontWeight: FontWeight.w200
        ),
      ),
      hoverChild: Text(
        letra,
        style: TextStyle(
            fontSize: 18,
            fontFamily: "BaskervilleOldFace",
            color: Colors.pinkAccent,
        ),
      ),
      onHover: (event){},
    );
  }
}
