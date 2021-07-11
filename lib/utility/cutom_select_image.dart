import 'package:adote_me/utility/show_dialog_remove.dart';
import 'package:adote_me/utility/circle_avatar_image.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'circle_avatar_add.dart';

class CustomSelectImage extends StatefulWidget {
  final List<File> listaImagens;
  final Function imagemGaleria;


  CustomSelectImage({required this.imagemGaleria, required this.listaImagens});

  @override
  _CustomSelectImageState createState() => _CustomSelectImageState();
}

class _CustomSelectImageState extends State<CustomSelectImage> {
  @override
  Widget build(BuildContext context) {
    return FormField<List>(
      initialValue: widget.listaImagens,
      validator: ( imagens ){
        if( imagens!.length == 0 ){
          return "Necessário selecionar uma imagem!";
        }
        return null;
      },
      builder: (state){
        return Column(
          children: <Widget>[
            Container(
              height: 100,
              child: ListView.builder(
                  itemCount: widget.listaImagens.length + 1,//botão adicionar
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index){
                    if(index == widget.listaImagens.length){
                      return GestureDetector(
                          onTap: (){
                            FocusScope.of(context).unfocus();
                            widget.imagemGaleria();
                          },
                          child: CircleAvatarAdd()
                      );
                    }
                    if(widget.listaImagens.length > 0){
                      return GestureDetector(
                        onTap: () async {
                          var confirmacao;
                          FocusScope.of(context).unfocus();
                          confirmacao = await showDialog(
                              context: context,
                              builder: (_) =>
                                  AcessDialog(widget.listaImagens[index])
                          );
                          if(confirmacao == true){
                            setState(() {
                            widget.listaImagens.removeAt(index);
                            });
                          }
                        },
                        child: CircleAvatarImage(widget.listaImagens[index]),
                      );
                    }
                    return Container();
                  }
              ),
            ),
            if( state.hasError )
              Container(
                child: Text(
                  "${state.errorText}",
                  style: TextStyle(
                      color: Colors.red.shade700, fontSize: 14
                  ),
                ),
              )
          ],);
      },
    );
  }
}
