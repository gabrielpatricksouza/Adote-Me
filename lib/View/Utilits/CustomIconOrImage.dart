import 'package:flutter/material.dart';

class IconOrImage extends StatelessWidget {
  final IconData icon;
  final String text;
  final String url;


  IconOrImage({this.icon, this.text, this.url});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      icon != null
       ? Padding(
         padding: const EdgeInsets.symmetric(horizontal: 8),
         child: Icon(
            icon,
          size: 30,
          color: Colors.white,
      ),
       )
       : CircleAvatar(),
      SizedBox(
        width: 10,
      ),
      Text(text,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20))
    ]
    );
  }
}
