import 'package:adote_me/app/modules/template/view/initial_template.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TemplateModule extends Module {

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => Template()),
      ];
}
