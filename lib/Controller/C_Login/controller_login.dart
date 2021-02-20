import 'package:adote_me/BancoDados/BancoDados.dart';
import 'package:adote_me/Model/Usuario.dart';
import 'package:adote_me/Store/LoginStore/login_store.dart';
import 'package:adote_me/Store/LoginStore/register_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'controller_login.g.dart';

class ControllerLogin = _ControllerLogin with _$ControllerLogin;

abstract class _ControllerLogin with Store{
  ConexaoBD _acessoBD = ConexaoBD();

  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final senha2Controller = TextEditingController();

  final loginStore = LoginStore();

  final registerStore = RegisterStore();

  Future recuperandoSenha(Usuario usuario) async =>
      await _acessoBD.esqueciSenha(usuario);
}
