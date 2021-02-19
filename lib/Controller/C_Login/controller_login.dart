import 'package:adote_me/BancoDados/BancoDados.dart';
import 'package:adote_me/Model/Usuario.dart';
import 'package:adote_me/Store/LoginStore/login_store.dart';
import 'package:mobx/mobx.dart';
part 'controller_login.g.dart';

class ControllerLogin = _ControllerLogin with _$ControllerLogin;

abstract class _ControllerLogin with Store{
  ConexaoBD acessoBD = ConexaoBD();

  final loginStore = LoginStore();

  Future recuperandoSenha(Usuario usuario) async =>
      await acessoBD.esqueciSenha(usuario);
}
