import 'package:adote_me/Store/UserStore/user_store.dart';
import 'package:mobx/mobx.dart';
part 'controller_perfil.g.dart';

class ControllerPerfil = _ControllerPerfil with _$ControllerPerfil;

abstract class _ControllerPerfil with Store{

  final userStore = UserStore();
}
