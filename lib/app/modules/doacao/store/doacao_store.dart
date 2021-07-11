import 'dart:io';
import 'package:adote_me/app/model/Animal.dart';
import 'package:adote_me/utility/simple_alert.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:adote_me/app/modules/doacao/services/doacao_db.dart';
part 'doacao_store.g.dart';

class DoacaoStore = _DoacaoStore with _$DoacaoStore;

abstract class _DoacaoStore with Store{
  final nomePetController = TextEditingController();
  final racaController = TextEditingController();
  final acessoDoacaoFirebase = DoacaoFirebase();

  @observable
  String nomePet = "";

  @action
  void setNomePet(String text) => nomePet = text;

  @observable
  String raca = "";

  @action
  void setRaca(String text) => raca = text;

  @observable
  late Animation<Alignment> animation;

  @observable
  late AnimationController animationController;

  @observable
  bool vacinado = false;

  @action
  selecionarVacinado() => vacinado = ! vacinado;

  @observable
  bool cadastrado = false;

  @action
  selecionarCadastrado() => cadastrado = ! cadastrado;

  @observable
  bool chipado = false;

  @action
  selecionarChipado() => chipado = ! chipado;

  @observable
  bool vermifugado = false;

  @action
  selecionarVermifugado() => vermifugado = ! vermifugado;

  @observable
  int valueSex = 3;

  @action
  changeValueSex(int value) => valueSex = value;

  @observable
  String? checkboxValue;

  @action
  changeCheckBox(String valueBox) => checkboxValue = valueBox;

  @observable
  bool firstValues = false;

  @action
  mudarPagina(){
    return nomePet.isNotEmpty && nomePet.length > 2 && valueSex == 0 && checkboxValue!.isNotEmpty;
  }

  @observable
  List<File> listaImagens = [];

  @action
  Future selecionarImagemGaleria() async {
    ImagePicker _imagePicker = ImagePicker();

    final imagemSelecionada =  await _imagePicker.getImage(source: ImageSource.gallery,);
    if( imagemSelecionada != null ) listaImagens.add( File(imagemSelecionada.path) );
  }

  enviarParaDoacao(context){
    bool response = _validarCampos(context);
    if(response){
      Animal animal = Animal();
      animal.nomePet = nomePet;
      // animal.especiePet = checkboxValue;
      animal.sexoPet = valueSex == 0 ? "Macho" : "";

      acessoDoacaoFirebase.cadastrarDadosPet(animal);
    }

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

    }else if(nomePet.isEmpty){
      simpleCustomAlert(
          context,
          AlertType.info,
          "ATENÇÃO",
          "Preencha o nome do pet para prosseguirmos!"
      );
      return false;

    }else if(nomePet.length <= 2){
      simpleCustomAlert(
          context,
          AlertType.info,
          "ATENÇÃO",
          "O nome do pet deve ter mais de dois caracteres."
      );
      return false;

    }else if(valueSex == 3){
      simpleCustomAlert(
          context,
          AlertType.info,
          "ATENÇÃO",
          "Escolha o sexo do pet."
      );
      return false;

    }else if(checkboxValue == null){
      simpleCustomAlert(
          context,
          AlertType.info,
          "ATENÇÃO",
          "Escolha a espécie do pet."
      );
      return false;

    }

    else return true;
  }
}
