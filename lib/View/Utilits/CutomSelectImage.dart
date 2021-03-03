import 'package:flutter/material.dart';
import 'package:adote_me/Animacoes/FadeAnimation.dart';
import 'package:adote_me/View/Utilits/CircleAvatarAdd.dart';
import 'package:adote_me/View/Utilits/CircleAvatarImage.dart';
import 'package:adote_me/View/Utilits/ShowDialog.dart';
import 'dart:io';

class CustomSelectImage extends StatelessWidget {
  final List<File> listaImagens;
  final Function imagemGaleria;


  CustomSelectImage({this.imagemGaleria, this.listaImagens});

  // List<File> _listaImagens = List();

  @override
  Widget build(BuildContext context) {
    return FormField<List>(
      initialValue: listaImagens,
      validator: ( imagens ){
        if( imagens.length == 0 ){
          return "Necessário selecionar uma imagem!";
        }
        return null;
      },
      builder: (state){
        return Column(
          children: <Widget>[
            FadeAnimation(
              0.2, Container(
              height: 100,
              child: ListView.builder(
                  itemCount: listaImagens.length + 1,//botão adicionar
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index){
                    if(index == listaImagens.length){
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                            onTap: (){
                              FocusScope.of(context).unfocus();
                              imagemGaleria();
                            },
                            child: CircleAvatarAdd()
                        ),
                      );
                    }
                    if(listaImagens.length > 0){
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal :8.0),
                        child: GestureDetector(
                          onTap: () async {
                            bool confirmacao;
                            FocusScope.of(context).unfocus();
                            confirmacao = await showDialog(
                                context: context,
                                builder: (_) =>
                                    AcessDialog(listaImagens[index])
                            );

                            if(confirmacao){
                              // setState(() {
                              listaImagens.removeAt(index);
                              // });
                            }
                          },
                          child: CircleAvatarImage(listaImagens[index]),
                        ),
                      );
                    }
                    return Container();
                  }
              ),
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
