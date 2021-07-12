import 'dart:io';
import 'package:adote_me/app/model/Animal.dart';
import 'package:adote_me/utility/custom_dialog_cep.dart';
import 'package:adote_me/utility/simple_alert.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  final cepPetController = TextEditingController();
  final acessoDoacaoFirebase = DoacaoFirebase();


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
  mudarValorSexo(int value) => valueSex = value;

  @observable
  String? especiePet;

  @action
  mudarEspeciePet(String valueBox) => especiePet = valueBox;

  @observable
  String? portePet;

  @action
  mudarPortePet(String valueBox) => portePet = valueBox;

  @observable
  List<File> listaImagens = [];

  @action
  Future selecionarImagemGaleria() async {
    ImagePicker _imagePicker = ImagePicker();

    final imagemSelecionada =  await _imagePicker.getImage(source: ImageSource.gallery,);
    if( imagemSelecionada != null ) listaImagens.add( File(imagemSelecionada.path) );
  }

  @observable
  bool carregando = false;

  var responseDio;

  @action
  buscarCep(String cep, context) async {

    if(cep.length == 10){
      carregando = true;

      String cepLimpo = cep.replaceAll(".", "");
      cepLimpo = cepLimpo.replaceAll("-", "");

      try {
        var response = await Dio().get('https://viacep.com.br/ws/$cepLimpo/json/');
        if(response.data["erro"] == true){
          await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => CustomDialogCep(
                  cidade: "CEP inválido",
                  bairro: "CEP inválido",
                  rua: "CEP inválido"
              )
          );

        }else{
          await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => CustomDialogCep(
                  cidade: response.data["localidade"] + " - " + response.data["uf"],
                  bairro: response.data["bairro"],
                  rua: response.data["logradouro"]
              )
          );
          responseDio = response.data;
        }

      } catch (e) {
        await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => CustomDialogCep(
                cidade: "Ocorreu um erro!",
                bairro: "Ocorreu um erro!",
                rua: "Ocorreu um erro!"
            )
        );
      }

      carregando = false;
    }
  }

  Future enviarParaDoacao(context) async {
    carregando = true;

    bool response = _validarCampos(context);
    if(response){
      Animal animal = Animal();
      animal = await _salvarImagens(animal);

      animal.nomePet = nomePetController.text;
      animal.especiePet = especiePet!;
      animal.portePet = portePet!;
      animal.sexoPet = valueSex == 0 ? "Macho" : "Fêmea";
      animal.chipadoPet  = chipado;
      animal.castradoPet = cadastrado;
      animal.vacinadoPet = vacinado;
      animal.vermifugadoPet = vermifugado;
      animal.cidade = responseDio["localidade"] + " - " + responseDio["uf"];
      animal.bairro = responseDio["bairro"];
      animal.rua = responseDio["logradouro"];

      acessoDoacaoFirebase.cadastrarDadosPet(animal);
      _limparCampos();
      carregando = false;

      simpleCustomAlert(
          context,
          AlertType.success,
          "",
          "Enviado com sucesso!"
      );
    }

  }

  Future<Animal> _salvarImagens(Animal animal) async {
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
      animal.imagensPet.add(urlImagem);
    }

    return animal;
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

    }else if(cepPetController.text.isEmpty){
      simpleCustomAlert(
          context,
          AlertType.info,
          "ATENÇÃO",
          "Preencha o cep para prosseguirmos!"
      );
      return false;

    }else if(responseDio == null){
      simpleCustomAlert(
          context,
          AlertType.info,
          "ATENÇÃO",
          "Insira um cep válido para prosseguirmos!"
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

    }else if(portePet == null){
      simpleCustomAlert(
          context,
          AlertType.info,
          "ATENÇÃO",
          "Escolha o porte do pet."
      );
      return false;

    }else if(especiePet == null){
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

  _limparCampos(){
    listaImagens.clear();
    nomePetController.text = "";
    cepPetController.text = "";
    valueSex = 3;
    especiePet = null;
    portePet = null;
    vacinado = false;
    vermifugado = false;
    cadastrado = false;
    chipado = false;
  }
}
