import 'package:adote_me/app/modules/pets/store/pets_store.dart';
import 'package:adote_me/app/modules/pets/view/pets_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PetsModule extends Module{
  @override
  List<Bind> get binds => [
    Bind((i) => PetsStore()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (_, args) => PetsPage()),
  ];

}