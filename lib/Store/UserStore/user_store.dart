import 'package:adote_me/BancoDados/Dao_User.dart';
import 'package:adote_me/Model/Usuario.dart';
import 'package:mobx/mobx.dart';
part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store{
  ConexaoBD _acessoBD = ConexaoBD();

  @observable
  bool loggedUser;

  @action
  bool checkLoggedUser() =>
      loggedUser = _acessoBD.checkCurrentUser();

  @observable
  bool logOut;

  @action
  Future<bool> logOutUser() async =>
      logOut = await _acessoBD.deslogarUsuario();

  @action
    Future recuperandoSenha(Usuario usuario) async =>
        await _acessoBD.esqueciSenha(usuario);
}
