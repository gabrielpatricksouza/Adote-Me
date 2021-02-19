import 'package:adote_me/BancoDados/BancoDados.dart';
import 'package:mobx/mobx.dart';
part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store{
  ConexaoBD acesso = ConexaoBD();

  @observable
  bool loggedUser;

  @action
  Future<bool> checkLoggedUser() async =>
      loggedUser = await acesso.currentUser();
}
