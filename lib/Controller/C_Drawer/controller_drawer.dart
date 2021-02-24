import 'package:adote_me/Store/DrawerStore/drawer_store.dart';
import 'package:adote_me/Store/UserStore/user_store.dart';
import 'package:mobx/mobx.dart';
part 'controller_drawer.g.dart';

class ControllerDrawer = _ControllerDrawer with _$ControllerDrawer;

abstract class _ControllerDrawer with Store{

  final userStore = UserStore();

  final drawerStore = DrawerStore();
}
