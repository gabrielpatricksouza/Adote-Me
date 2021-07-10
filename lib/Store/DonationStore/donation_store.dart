import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'donation_store.g.dart';

class DonationStore = _DonationStore with _$DonationStore;

abstract class _DonationStore with Store{

  final nomePetController = TextEditingController();
  final racaController = TextEditingController();

  @observable
  String nomePet = "";

  @action
    void setNomePet(String text) {
  nomePet = text;
  print(valueSex.isNaN);
}

  @observable
  String raca = "";

  @action
    void setRaca(String text) => nomePet = text;

  @observable
  Animation<Alignment> animation;

  @observable
  AnimationController animationController;

  @observable
    bool isChecked = false;

  @action
    changeChecked() => isChecked = ! isChecked;

  @observable
    bool petChecked = false;

  @action
  changePetChecked() => petChecked = !petChecked;

  @observable
    int valueSex;

  @action
  changeValueSex(int value) => valueSex = value;

  @observable
    int checkboxValue;

  @action
  changeCheckBox(int valueBox) => checkboxValue = valueBox;

  @action
  cleanVariables(){
    checkboxValue = null;
    petChecked = false;
    valueSex = null;
  }

  @computed
  bool get firstValues{
    return nomePet.isNotEmpty && nomePet.length > 2 && valueSex != null && checkboxValue != null;
  }

  @observable
    List<File> listaImagens = List();

  @action
  selecionarImagemGaleria() async {

    // ignore: deprecated_member_use
    PickedFile imagemSelecionada = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    // File imagemSelecionada = await ImagePicker.pickImage(source: ImageSource.gallery);

    // if( imagemSelecionada != null )
      // listaImagens.add( imagemSelecionada );
  }
}
