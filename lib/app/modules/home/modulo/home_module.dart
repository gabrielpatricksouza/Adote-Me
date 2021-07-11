import 'package:adote_me/app/modules/home/store/home_store.dart';
import 'package:adote_me/app/modules/home/view/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module{
  @override
  List<Bind> get binds => [
    Bind((i) => HomeStore()),

  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}