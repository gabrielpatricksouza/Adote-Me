import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'donation_store.g.dart';

class DonationStore = _DonationStore with _$DonationStore;

abstract class _DonationStore with Store{

  final nomePetController = TextEditingController();
  final racaController = TextEditingController();

  @observable
  String nomePet = "";

  @action
    void setNomePet(String text) => nomePet = text;

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
}
