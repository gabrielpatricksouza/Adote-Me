import 'package:adote_me/app/modules/sobre/store/sobre_store.dart';
import 'package:adote_me/app/modules/sobre/view/sobre_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SobreModule extends Module{
  @override
  List<Bind> get binds => [
    Bind((i) => SobreStore()),

  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (_, args) => SobrePage()),
  ];

}