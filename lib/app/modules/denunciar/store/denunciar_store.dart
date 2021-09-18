import 'dart:io';

import 'package:adote_me/app/model/Ocorrencia.dart';
import 'package:adote_me/utility/simple_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
part 'denunciar_store.g.dart';

class DenunciarStore = _DenunciarStoreBase with _$DenunciarStore;
abstract class _DenunciarStoreBase with Store {

  final nomePetController = TextEditingController();
  final cepPetController = TextEditingController();
  final wppPetController = TextEditingController();
  // final acessoDoacaoFirebase = DoacaoFirebase();

  @observable
  String? tipoDenuncia;

  @action
  mudarDenuncia(String valueBox) => tipoDenuncia = valueBox;

  @observable
  List<File> listaImagens = [];

  @action
  Future selecionarImagemGaleria() async {
    ImagePicker _imagePicker = ImagePicker();

    // ignore: deprecated_member_use
    final imagemSelecionada =  await _imagePicker.getImage(source: ImageSource.gallery,);
    if( imagemSelecionada != null ) listaImagens.add( File(imagemSelecionada.path) );
  }

  @observable
  bool carregando = false;

  Future<Denuncia> _salvarImagens(Denuncia denuncia) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    FirebaseAuth _auth = FirebaseAuth.instance;
    Reference pastaRaiz = storage.ref();

    User user = _auth.currentUser!;
    print(user.uid);

    for(var imagem in listaImagens){

      String nomeImagem = DateTime.now().millisecondsSinceEpoch.toString();
      Reference arquivo = pastaRaiz
          .child("doacao")
          .child( user.uid )
          .child( nomeImagem );

      UploadTask uploadTask = arquivo.putFile(imagem);
      TaskSnapshot taskSnapshot = await uploadTask;

      String urlImagem = await taskSnapshot.ref.getDownloadURL();
      denuncia.imagensDenuncia = [];
      denuncia.imagensDenuncia!.add(urlImagem);
    }

    return denuncia;
  }

  _validarCampos(context){
    if(listaImagens.length == 0){
      simpleCustomAlert(
          context,
          AlertType.info,
          "ATENÇÃO",
          "Adicione no mínimo uma foto do pet."
      );
      return false;

    }else if(nomePetController.text.isEmpty){
      simpleCustomAlert(
          context,
          AlertType.info,
          "ATENÇÃO",
          "Preencha o nome do pet para prosseguirmos!"
      );
      return false;

    }else if(nomePetController.text.length <= 2){
      simpleCustomAlert(
          context,
          AlertType.info,
          "ATENÇÃO",
          "O nome do pet deve ter mais de dois caracteres."
      );
      return false;

    }else if(tipoDenuncia == null){
      simpleCustomAlert(
          context,
          AlertType.info,
          "ATENÇÃO",
          "Escolha o tipo da denuncia."
      );
      return false;

    }

    else return true;
  }

  _limparCampos(){
    listaImagens.clear();
    nomePetController.text = "";
    cepPetController.text = "";
    wppPetController.text = "";
    tipoDenuncia = null;
  }
}