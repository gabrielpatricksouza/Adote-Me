import 'package:adote_me/app/modules/doacao/store/doacao_store.dart';
import 'package:adote_me/app/modules/doacao/view/doacao_page.dart';
import 'package:flutter_modular/flutter_modular.dart';


class DoacaoModule extends Module{

  @override
  List<Bind> get binds => [
    Bind((i) => DoacaoStore()),

  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, args) => DoacaoPage()),
  ];
}