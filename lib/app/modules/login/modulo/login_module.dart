import 'package:adote_me/app/modules/login/store/login_store.dart';
import 'package:adote_me/app/modules/login/store/register_store.dart';
import 'package:adote_me/app/modules/login/view/loginSingIn.dart';
import 'package:adote_me/app/modules/login/view/loginSingUp.dart';
import 'package:adote_me/app/modules/login/view/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
class LoginModule extends Module{
  @override
  List<Bind> get binds => [
    Bind((i) => LoginStore()),
    Bind((i) => RegisterStore()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, args) => LoginPage()),
    ChildRoute('/singIn', child: (_, args) => SingIn()),
    ChildRoute('/singUp', child: (_, args) => SingUp()),
  ];

}