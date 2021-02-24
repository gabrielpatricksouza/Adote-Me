import 'package:adote_me/BancoDados/Dao_User.dart';
import 'package:adote_me/Model/Usuario.dart';
import 'package:mobx/mobx.dart';
part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store{
  ConexaoBD _acessoBD = ConexaoBD();

  @observable
  bool loggedUser = false;

  @action
  bool checkLoggedUser() =>
      loggedUser = _acessoBD.checkCurrentUser();

  @observable
  bool logOut;

  @action
  Future<bool> logOutUser() async =>
      logOut = await _acessoBD.deslogarUsuario();

  @action
    Future<String> recuperandoSenha(String email) async =>
        await _acessoBD.esqueciSenha(email);

  @action
    Future<Usuario> mudandoEmail(Usuario usuario) async =>
        await _acessoBD.alterarEmail(usuario);

  @action
    Future deletandoConta() async {
      return await _acessoBD.exluirUsuario();
  }

  @observable
  String nome = "";

  @observable
  String email = "";

  @observable
  String urlImagem = "";

  @action
  Future recuperandoDadosUsuario() async {
    if(loggedUser){
      Usuario usuario = Usuario();
      usuario = await _acessoBD.recuperarDadosUsuario();

      nome = usuario.nome;
      email = usuario.email;
      urlImagem = usuario.urlImage;
    }
  }
}
