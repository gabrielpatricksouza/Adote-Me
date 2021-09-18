import 'package:adote_me/app/app_controller.dart';
import 'package:adote_me/app/modules/template/services/db_user.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'template_store.g.dart';

class TemplateStore = _TemplateStore with _$TemplateStore;

abstract class _TemplateStore with Store{
  ConexaoBDTemplate _acessoBD = ConexaoBDTemplate();
  final AppController _controllerApp = Modular.get();


  void deslogarUsuario() async {
     await _acessoBD.deslogarUsuario();
    _controllerApp.limparVariaveis();
    _controllerApp.mudarRota(0);
  }


  void navegacaoAutenticada(int numRota){
    if(_acessoBD.checkCurrentUser() == false) Modular.to.pushNamed("/login");
    else _controllerApp.mudarRota(numRota);
  }


}
