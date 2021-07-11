import 'package:flutter/material.dart';

class CustomIconText extends StatelessWidget {
  final IconData? icon;
  final String text;
  CustomIconText({this.icon, this.text = ""});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Icon(
              icon,
            color: Color(0xff425D5E),
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
