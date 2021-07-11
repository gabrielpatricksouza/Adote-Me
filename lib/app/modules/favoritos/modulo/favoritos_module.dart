import 'package:adote_me/app/modules/favoritos/store/favoritos_store.dart';
import 'package:adote_me/app/modules/favoritos/view/favoritos_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoritosModule extends Module{
  @override
  List<Bind> get binds => [
    Bind((i) => FavoritosStore()),

  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (_, args) => FavoritosPage()),
  ];
}