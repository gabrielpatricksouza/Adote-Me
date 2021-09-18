import 'package:adote_me/app/modules/denunciar/store/denunciar_store.dart';
import 'package:adote_me/app/modules/denunciar/view/denunciar_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DenunciarModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DenunciarStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => DenunciarPage()),
  ];
}
