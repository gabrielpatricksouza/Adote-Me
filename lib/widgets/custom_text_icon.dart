import 'package:flutter/material.dart';

class CustomTextIcon extends StatelessWidget {

  final String text;
  final IconData icon;
  final Function action;
  const CustomTextIcon({Key? key, required this.text, required this.icon, required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            text,
            style: TextStyle(
                color: Color(0xff274e4e),
                fontSize: 30,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),

        IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            iconSize: 27,
            icon: Icon(icon),
            onPressed: action()
        ),
      ],
    );
  }
}
