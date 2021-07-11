import 'package:adote_me/app/modules/parceiros/store/parceiros_store.dart';
import 'package:adote_me/app/modules/parceiros/view/parceiros_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ParceirosModule extends Module{
  @override
  List<Bind> get binds => [
    Bind((i) => ParceirosStore()),

  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (_, args) => ParceirosPage()),
  ];

}