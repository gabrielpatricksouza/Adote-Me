import 'package:adote_me/Store/LoginStore/login_store.dart';
import 'package:adote_me/Store/LoginStore/register_store.dart';
import 'package:adote_me/Store/UserStore/user_store.dart';
import 'package:mobx/mobx.dart';
part 'controller_login.g.dart';

class ControllerLogin = _ControllerLogin with _$ControllerLogin;

abstract class _ControllerLogin with Store{

  final loginStore = LoginStore();

  final registerStore = RegisterStore();

  final userStore = UserStore();

}
