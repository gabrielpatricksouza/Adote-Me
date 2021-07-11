import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

class CustomLetterAnimated2 extends StatelessWidget {
  final String letra;

  const CustomLetterAnimated2({this.letra = ""});

  @override
  Widget build(BuildContext context) {

    return HoverWidget(
      child: Text(
        letra,
        style: TextStyle(
          fontSize: 60,
          fontFamily: "Presa",
          // fontWeight: FontWeight.w200
        ),
      ),
      hoverChild: Text(
        letra,
        style: TextStyle(
            fontSize: 60,
            fontFamily: "Presa",
            //Colors.pink.shade800
            shadows: [Shadow(color: Colors.pink.shade800, offset: Offset(10, 10)), Shadow(color: Colors.black, blurRadius: 8, offset: Offset(10, 10))]
          // fontWeight: FontWeight.w200
        ),
      ),
      onHover: (event){},
    );
  }
}
