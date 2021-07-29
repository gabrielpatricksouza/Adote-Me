import 'package:adote_me/app/modules/home/store/home_store.dart';
import 'package:adote_me/app/modules/home/view/home_page.dart';
import 'package:adote_me/app/modules/home/view/screenDetails.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module{
  @override
  List<Bind> get binds => [
    Bind((i) => HomeStore()),

  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, args) => HomePage()),
    // ChildRoute('/detalhes', child: (_, args) => ScreenDetails(animal: args.data)),
  ];
}