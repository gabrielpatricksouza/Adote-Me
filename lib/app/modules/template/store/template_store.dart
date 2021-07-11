import 'package:adote_me/app/app_controller.dart';
import 'package:adote_me/app/modules/template/services/db_user.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'template_store.g.dart';

class TemplateStore = _TemplateStore with _$TemplateStore;

abstract class _TemplateStore with Store{
  ConexaoBDTemplate _acessoBD = ConexaoBDTemplate();
  final AppController _controllerApp = Modular.get();

  @observable
  bool usuarioLogado = false;

  @action
  bool checkLoggedUser() =>
      usuarioLogado = _acessoBD.checkCurrentUser();

  void deslogarUsuario() async {
    bool response = await _acessoBD.deslogarUsuario();
    if(response){
      _controllerApp.limparVariaveis();
      _controllerApp.mudarRota(0);
    }
  }


  void navegacaoAutenticada(int numRota){
    if(_acessoBD.checkCurrentUser()) _controllerApp.mudarRota(numRota);
    else Modular.to.pushNamed("/login");
  }


}
