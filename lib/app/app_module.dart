import 'package:adote_me/app/modules/denunciar/store/denunciar_store.dart';
import 'package:adote_me/app/modules/doacao/store/doacao_store.dart';
import 'package:adote_me/app/modules/favoritos/store/favoritos_store.dart';
import 'package:adote_me/app/modules/login/modulo/login_module.dart';
import 'package:adote_me/app/modules/parceiros/store/parceiros_store.dart';
import 'package:adote_me/app/modules/sobre/store/sobre_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app_controller.dart';
import 'modules/home/store/home_store.dart';
import 'modules/login/store/login_store.dart';
import 'modules/pets/store/pets_store.dart';
import 'modules/template/modulo/template_module.dart';
import 'modules/template/store/template_store.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.lazySingleton((i) => AppController()),
    Bind.lazySingleton((i) => TemplateStore()),
    Bind.lazySingleton((i) => LoginStore()),
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => SobreStore()),
    Bind.lazySingleton((i) => DoacaoStore()),
    Bind.lazySingleton((i) => DenunciarStore()),
    Bind.lazySingleton((i) => PetsStore()),
    Bind.lazySingleton((i) => ParceirosStore()),
    Bind.lazySingleton((i) => FavoritosStore()),
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/',      module: TemplateModule()),
    ModuleRoute('/login', module: LoginModule()),
  ];
}
