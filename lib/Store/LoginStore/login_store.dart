import 'package:adote_me/BancoDados/Dao_User.dart';
import 'package:adote_me/Model/Usuario.dart';
import 'package:adote_me/View/Alerts/SimpleAlert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store{

  Usuario _usuario = Usuario();
  ConexaoBD _acessoBD = ConexaoBD();

  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  @observable
  bool visualizar  = true;

  @action
  void boolVisualizar() => visualizar = !visualizar;

  @observable
  String email = "";

  @action
  void setEmail(String text) => email = text;

  @observable
  String senha = "";

  @action
  void setSenha(String text) => senha = text;

  @observable
  String recuperarSenha = "";

  @action
  void setRecuperarSenha(String text) => recuperarSenha = text;

  @computed
  bool get finalizar => email.isNotEmpty && senha.isNotEmpty;

  @observable
  bool carregando  = false;

  @observable
  dynamic resultado = false;

  @action
  Future signInWithEmailAndPassword(context) async {

    if(finalizar){
      carregando = true;

      _usuario.email = email.trim();
      _usuario.senha = senha.trim();

      resultado = await _acessoBD.logarUsuario(_usuario);
      carregando = false;

      if(resultado != true){
        simpleCustomAlert(context, AlertType.info, "ATENÇÃO", resultado);
      }
      else Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
    }
    else simpleCustomAlert(
        context,
        AlertType.info,
        "ATENÇÃO",
        "Preencha todos os campos para prosseguirmos!"
    );
  }

  @action
  Future singInWithGoogle(context) async {
    carregando = true;
    bool response = await _acessoBD.loginWithGoogle();

    if(response != true){
      carregando = false;
      //mensagem diferente do registerStore
      simpleCustomAlert(context, AlertType.error, "ATENÇÃO",
          "Não foi possível entrar no app!");
    }
    else Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);

    carregando = false;
  }

  @action
  Future singInWithFacebook(context) async {
    carregando = true;
    bool response = await _acessoBD.loginWithFacebook();

    if(response != true){
      carregando = false;
      simpleCustomAlert(context, AlertType.error, "ATENÇÃO",
          "Não foi possível entrar no app!");
    }
    else Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);

    carregando = false;
  }

}
