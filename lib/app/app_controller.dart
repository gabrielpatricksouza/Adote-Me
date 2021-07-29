import 'package:adote_me/app/services/database.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'model/Usuario.dart';

part 'app_controller.g.dart';

@Injectable()
class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {

  DataBaseGlobal _acessoBDGlobal = DataBaseGlobal();

  @observable
  int index = 0;

  @action
  mudarRota(int value) {
    index = value;
  }

  @observable
  Usuario usuario = Usuario();

  @action
  recuperarDadosUser() async {
    bool response = _acessoBDGlobal.checkCurrentUser();
    if(response){
      usuario = await _acessoBDGlobal.recuperarDadosUsuario();
    }else{
      await _acessoBDGlobal.logarAnonimamente();
    }
  }

  @action
  limparVariaveis(){
    usuario = Usuario.clean();
  }
}
