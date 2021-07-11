import 'dart:io';

import 'package:flutter/material.dart';

class AcessDialog extends StatelessWidget {

  final File imagem;
  AcessDialog(this.imagem);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xffd7ecec),
      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          Image.file(imagem),
          TextButton(
              onPressed: (){
                Navigator.of(context).pop(true);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)
              ),
              child: Text("Excluir", style: TextStyle(color: Colors.white),)
          )
        ],
      ),
    );
  }
}
