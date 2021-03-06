import 'package:adote_me/constants/constantes.dart';
import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final IconData icon;
  final Color color;
  CustomCircleAvatar({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: new Border.all(
          color: primaryGreen,
          width: 1.0,
        ),
      ),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 30,
        child: Icon(
            icon,
          color: color,
        ),
      ),
    );
  }
}
