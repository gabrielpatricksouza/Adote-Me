import 'dart:io';
import 'package:flutter/material.dart';

class CircleAvatarImage extends StatelessWidget {

  final File imagem;
  CircleAvatarImage(this.imagem);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: FileImage(imagem),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Color.fromRGBO(255, 255, 255, 0.3),
        ),
        alignment: Alignment.center,
        child: Icon(Icons.delete, color: Colors.red, size: 25,),
      ),
    );
  }
}
