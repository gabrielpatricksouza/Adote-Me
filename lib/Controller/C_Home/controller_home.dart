import 'package:adote_me/Store/HomeStore/home_store.dart';
import 'package:adote_me/Store/UserStore/user_store.dart';
import 'package:mobx/mobx.dart';
part 'controller_home.g.dart';

class ControllerHome = _ControllerHome with _$ControllerHome;

abstract class _ControllerHome with Store{
  final userStore = UserStore();

  final homeStore = HomeStore();
}
