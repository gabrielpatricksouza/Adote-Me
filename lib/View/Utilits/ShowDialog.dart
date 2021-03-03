import 'dart:io';

import 'package:flutter/material.dart';

class AcessDialog extends StatelessWidget {

  final File imagem;
  AcessDialog(this.imagem);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.file(imagem),
          FlatButton(
              onPressed: (){
                Navigator.of(context).pop(true);
              },
              textColor: Colors.red,
              child: Text("Excluir")
          )
        ],
      ),
    );
  }
}
